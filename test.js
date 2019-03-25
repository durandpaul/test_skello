// var hexa1 = '0x0f4';
// var hexa2 = '0acdadecf822eeff32aca5830e438cb54aa722e3';
// var hexa3 = '8BADF00D';

// var regex = /\d[0-9a-fx]+/gmi;

// var found = hexa2.match(regex);

// console.log(found);


function fRecursive(n) {
    if (n === 0) {
        return 1;
    } 
    else if(n === 1) {
        return 3
    }
    else {
        return (n * fRecursive(n - 1) - fRecursive(n - 2)); 
    }
}

console.log(fRecursive(6));
