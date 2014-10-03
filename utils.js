function toFahrenheit(celsius)
{
    return (celsius * (9/5)) + 32
}
var weekDaysArray = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
var dateObj = new Date()
function getSecondDayName()
{
    if(dateObj.getDay()+1 > 6)
        return weekDaysArray[ (dateObj.getDay()+1)-7]
    else
        return weekDaysArray[dateObj.getDay()+1]
}

function getThirdDayName()
{
    if(dateObj.getDay()+2 > 6)
        return weekDaysArray[ (dateObj.getDay()+2)-7]
    else
        return weekDaysArray[dateObj.getDay()+2]
}

function getFourthDayName()
{
    if(dateObj.getDay()+3 > 6)
        return weekDaysArray[ (dateObj.getDay()+3)-7]
    else
        return weekDaysArray[dateObj.getDay()+3]
}

function getFifthDayName()
{
    if(dateObj.getDay()+4 > 6)
        return weekDaysArray[(dateObj.getDay()+4)-7]
    else
        return weekDaysArray[dateObj.getDay()+4]
}
