'use strict';

const CODES = {
    PROGRAM_ERROR:0,
    NOT_FOUND:1
};

const TYPES={
    INFO:'info',
    ERROR:'error'
};

const MESSAGES={
    PROGRAM_ERROR: ()=>({
        message:'Sorry! Error in our program',
        code:CODES.PROGRAM_ERROR,
        type:TYPES.ERROR
    }),
    NOT_FOUND:(key,value)=>({
        message:`No resouce found with ${key} ${value}`,
        code:CODES.NOT_FOUND,
        type:TYPES.INFO
    })    
}

module.exports = {CODES, TYPES, MESSAGES}