const { Lunar, Solar } = require("./lunar");
const d = Lunar.fromDate(new Date());

const yi = d.getDayYi().slice(0, 4).join(" ");
const ji = d.getDayJi().slice(0, 4).join(" ");
const dt = Solar.fromDate(new Date());
const date = `${dt.getYear()}-${dt.getMonth()}-${dt.getDay()}`;
const xinZuo = `${dt.getXingZuo()}`;

function getTodayYiJi() {
  return `'${date}  星座：${xinZuo}  宜： ${yi}  忌：${ji}'`
  // return {
    // yi,
    // ji,
    // date,
    // xinZuo,
  // };
}

module.exports = {
  getTodayYiJi,
};
