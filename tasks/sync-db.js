


let times = 5;
const syncDB = () => {
    times++;
    console.log('Tick cada 5 segundos: => ' + times);
    return times;
}

module.exports = syncDB;
