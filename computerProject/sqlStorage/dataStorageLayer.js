'use strict';
const path = require('path');

const Database = require('./database');
const config = require('./StorageConfig.json');
const options = require(path.join(__dirname, config.connectionOptions));
const sql = require(path.join(__dirname, config.sqlStatements));

const { CODES, TYPES, MESSAGES } = require('./statusCodes');

const getAllSql = sql.getAll.join(' ');
const getOneSql = sql.getOne.join(' ');
const insertSql = sql.insert.join(' ');
const updateSql = sql.update.join(' ');
const removeSql = sql.remove.join(' ');

const PRIMARY_KEY = sql.primaryKey;


module.exports = class Datastorage {

    constructor() {
        this.db = new Database(options)
    }

    get CODES() {
        return CODES;
    }

    get TYPES() {
        return TYPES;
    }

    getAll() {
        return new Promise(async (resolve, reject) => {
            try {
                const result = await this.db.doQuery(getAllSql);
                resolve(result.queryResult);
            }
            catch (err) {
                console.log(err);
                reject(MESSAGES.PROGRAM_ERROR());
            }
        });
    }
    getOne(id) {
        return new Promise(async (resolve, reject) => {
            try {
                if (!id) {
                    reject(MESSAGES.NOT_FOUND('empty', PRIMARY_KEY));
                } else {
                    const result = await this.db.doQuery(getOneSql, [id]);
                    if (result.queryResult.length > 0) {
                        resolve(result.queryResult[0]);
                    } else {
                        reject(MESSAGES.NOT_FOUND('empty', PRIMARY_KEY));
                    }
                }
            }
            catch (err) {
                console.log(err);
                reject(MESSAGES.NOT_FOUND(PRIMARY_KEY, id));
            }
        });
    }
}