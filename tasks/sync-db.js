


let times = 5;
const syncDB = () => {
    times += 5;
    console.log('Tick cada 5 segundos: => ' + times);
    return times;
}

module.exports = syncDB;
