import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0
import "utils.js" as Utils


Rectangle{
    id : mainRec
    width : Math.round(Screen.width / 1.5)
    height : Math.round(Screen.height / 1.5)

    states :
    [
        State { name : "SLIDED" ; PropertyChanges { target: mainRec ; x : x-=300 } },
        State { name : "NOTSLIDED" ; PropertyChanges { target: mainRec ; x : 0 } }
    ]

    state : "NOTSLIDED"

    transitions: Transition{ PropertyAnimation { properties: "x"; easing.type: Easing.Linear } }
    FontLoader { id : bariol ; source: "resources/fonts/Bariol_Regular.otf" }

    Image
    {
        id : background
        source : "resources/Clouds Bright.jpg"

        x : -2000

        SequentialAnimation
        {
            running : true
            loops: Animation.Infinite
            NumberAnimation
            {
                target : background
                property : "x"
                from : 0
                to : -900
                duration : 30000
            }

            NumberAnimation
            {
                target : background
                property : "x"
                from : -900
                to : 0
                duration : 30000
            }
        }
    }

    XmlListModel
    {
        id : weatherDataModel
        source : "http://api.openweathermap.org/data/2.5/forecast/daily?q=el-harrouch,dz&mode=xml&units=metric&cnt=5"
        query : "/weatherdata"

        /*====================== Metadata ======================*/
        XmlRole { name : "CityName" ; query : "location/name/string()" }
        XmlRole { name : "CountryCode" ; query : "location/country/string()" }
        XmlRole { name : "Latitude" ; query : "location/location/@latitude/string()" }
        XmlRole { name : "Longitude" ; query : "location/location/@longitude/string()" }

        /*====================== First day data ======================*/
        XmlRole { name : "FirstDayDate" ; query : "forecast/time[1]/@date/string()" }
        XmlRole { name : "Sunrise" ; query : "sun/@rise/string()" }
        XmlRole { name : "Sunset" ; query : "sun/@set/string()" }
        XmlRole { name : "FirstDaySymbol" ; query : "forecast/time[1]/symbol/@name/string()" }
        XmlRole { name : "FirstDayIcon" ; query : "forecast/time[1]/symbol/@var/string()" }
        XmlRole { name : "FirstDayWindDirectionDeg" ; query : "forecast/time[1]/windDirection/@deg/string()" }
        XmlRole { name : "FirstDayWindDirectionCode" ; query : "forecast/time[1]/windDirection/@code/string()" }
        XmlRole { name : "FirstDayWindSpeed" ; query : "forecast/time[1]/windSpeed/@mps/string()" }
        XmlRole { name : "FirstDayWindSpeedName" ; query : "forecast/time[1]/windSpeed/@name/string()" }
        XmlRole { name : "FirstDayDayTemperature" ; query : "forecast/time[1]/temperature/@day/string()" }
        XmlRole { name : "FirstDayNightTemperature" ; query : "forecast/time[1]/temperature/@night/string()" }
        XmlRole { name : "FirstDayMinTemperature" ; query : "forecast/time[1]/temperature/@min/string()" }
        XmlRole { name : "FirstDayMaxTemperature" ; query : "forecast/time[1]/temperature/@max/string()" }
        XmlRole { name : "FirstDayPressure" ; query : "forecast/time[1]/pressure/@value/string()" }
        XmlRole { name : "FirstDayHumidity" ; query : "forecast/time[1]/humidity/@value/string()" }
        XmlRole { name : "FirstDayClouds" ; query : "forecast/time[1]/clouds/@value/string()" }
        XmlRole { name : "FirstDayCloudsValue" ; query : "forecast/time[1]/clouds/@all/string()" }

        /*====================== Second day data ======================*/

        XmlRole { name : "SecondDaySymbol" ; query : "forecast/time[2]/symbol/@name/string()" }
        XmlRole { name : "SecondDayIcon" ; query : "forecast/time[2]/symbol/@var/string()" }
        XmlRole { name : "SecondDayWindDirectionDeg" ; query : "forecast/time[2]/windDirection/@deg/string()" }
        XmlRole { name : "SecondDayWindDirectionCode" ; query : "forecast/time[2]/windDirection/@code/string()" }
        XmlRole { name : "SecondDayWindSpeed" ; query : "forecast/time[2]/windSpeed/@mps/string()" }
        XmlRole { name : "SecondDayWindSpeedName" ; query : "forecast/time[2]/windSpeed/@name/string()" }
        XmlRole { name : "SecondDayDayTemperature" ; query : "forecast/time[2]/temperature/@day/string()" }
        XmlRole { name : "SecondDayNightTemperature" ; query : "forecast/time[2]/temperature/@night/string()" }
        XmlRole { name : "SecondDayMinTemperature" ; query : "forecast/time[2]/temperature/@min/string()" }
        XmlRole { name : "SecondDayMaxTemperature" ; query : "forecast/time[2]/temperature/@max/string()" }
        XmlRole { name : "SecondDayPressure" ; query : "forecast/time[2]/pressure/@value/string()" }
        XmlRole { name : "SecondDayHumidity" ; query : "forecast/time[2]/humidity/@value/string()" }
        XmlRole { name : "SecondDayClouds" ; query : "forecast/time[2]/clouds/@value/string()" }
        XmlRole { name : "SecondDayCloudsValue" ; query : "forecast/time[2]/clouds/@all/string()" }


        /*====================== Third day data ======================*/

        XmlRole { name : "ThirdDaySymbol" ; query : "forecast/time[3]/symbol/@name/string()" }
        XmlRole { name : "ThirdDayIcon" ; query : "forecast/time[3]/symbol/@var/string()" }
        XmlRole { name : "ThirdDayWindDirectionDeg" ; query : "forecast/time[3]/windDirection/@deg/string()" }
        XmlRole { name : "ThirdDayWindDirectionCode" ; query : "forecast/time[3]/windDirection/@code/string()" }
        XmlRole { name : "ThirdDayWindSpeed" ; query : "forecast/time[3]/windSpeed/@mps/string()" }
        XmlRole { name : "ThirdDayWindSpeedName" ; query : "forecast/time[3]/windSpeed/@name/string()" }
        XmlRole { name : "ThirdDayDayTemperature" ; query : "forecast/time[3]/temperature/@day/string()" }
        XmlRole { name : "ThirdDayNightTemperature" ; query : "forecast/time[3]/temperature/@night/string()" }
        XmlRole { name : "ThirdDayMinTemperature" ; query : "forecast/time[3]/temperature/@min/string()" }
        XmlRole { name : "ThirdDayMaxTemperature" ; query : "forecast/time[3]/temperature/@max/string()" }
        XmlRole { name : "ThirdDayPressure" ; query : "forecast/time[3]/pressure/@value/string()" }
        XmlRole { name : "ThirdDayHumidity" ; query : "forecast/time[3]/humidity/@value/string()" }
        XmlRole { name : "ThirdDayClouds" ; query : "forecast/time[3]/clouds/@value/string()" }
        XmlRole { name : "ThirdDayCloudsValue" ; query : "forecast/time[3]/clouds/@all/string()" }


        /*====================== Fourth day data ======================*/

        XmlRole { name : "FourthDaySymbol" ; query : "forecast/time[4]/symbol/@name/string()" }
        XmlRole { name : "FourthDayIcon" ; query : "forecast/time[4]/symbol/@var/string()" }
        XmlRole { name : "FourthDayWindDirectionDeg" ; query : "forecast/time[4]/windDirection/@deg/string()" }
        XmlRole { name : "FourthDayWindDirectionCode" ; query : "forecast/time[4]/windDirection/@code/string()" }
        XmlRole { name : "FourthDayWindSpeed" ; query : "forecast/time[4]/windSpeed/@mps/string()" }
        XmlRole { name : "FourthDayWindSpeedName" ; query : "forecast/time[4]/windSpeed/@name/string()" }
        XmlRole { name : "FourthDayDayTemperature" ; query : "forecast/time[4]/temperature/@day/string()" }
        XmlRole { name : "FourthDayNightTemperature" ; query : "forecast/time[4]/temperature/@night/string()" }
        XmlRole { name : "FourthDayMinTemperature" ; query : "forecast/time[4]/temperature/@min/string()" }
        XmlRole {  name : "FourthDayMaxTemperature" ; query : "forecast/time[4]/temperature/@max/string()" }
        XmlRole { name : "FourthDayPressure" ; query : "forecast/time[4]/pressure/@value/string()" }
        XmlRole { name : "FourthDayHumidity" ; query : "forecast/time[4]/humidity/@value/string()" }
        XmlRole {  name : "FourthDayClouds" ; query : "forecast/time[4]/clouds/@value/string()" }
        XmlRole { name : "FourthDayCloudsValue" ; query : "forecast/time[4]/clouds/@all/string()" }


        /*====================== Fifth day data ======================*/

        XmlRole { name : "FifthDaySymbol" ; query : "forecast/time[5]/symbol/@name/string()" }
        XmlRole { name : "FifthDayIcon" ; query : "forecast/time[5]/symbol/@var/string()" }
        XmlRole { name : "FifthDayWindDirectionDeg" ; query : "forecast/time[5]/windDirection/@deg/string()" }
        XmlRole { name : "FifthDayWindDirectionCode" ; query : "forecast/time[5]/windDirection/@code/string()" }
        XmlRole { name : "FifthDayWindSpeed" ; query : "forecast/time[5]/windSpeed/@mps/string()" }
        XmlRole { name : "FifthDayWindSpeedName" ; query : "forecast/time[5]/windSpeed/@name/string()" }
        XmlRole { name : "FifthDayDayTemperature" ; query : "forecast/time[5]/temperature/@day/string()" }
        XmlRole { name : "FifthDayNightTemperature" ; query : "forecast/time[5]/temperature/@night/string()" }
        XmlRole { name : "FifthDayMinTemperature" ; query : "forecast/time[5]/temperature/@min/string()"  }
        XmlRole { name : "FifthDayMaxTemperature" ; query : "forecast/time[5]/temperature/@max/string()" }
        XmlRole { name : "FifthDayPressure" ; query : "forecast/time[5]/pressure/@value/string()"  }
        XmlRole { name : "FifthDayHumidity" ; query : "forecast/time[5]/humidity/@value/string()"  }
        XmlRole { name : "FifthDayClouds" ; query : "forecast/time[5]/clouds/@value/string()"  }
        XmlRole { name : "FifthDayCloudsValue" ; query : "forecast/time[5]/clouds/@all/string()" }
    }



    ListView
    {
        model : weatherDataModel
        delegate : Column
        {
        x : 20
        spacing : 25
        Row
        {
            spacing : 50
            Row
            {
                id : locationSection
                spacing : 10
                Text
                {
                    text : "Location:"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: bariol.name
                }

                Text
                {
                    id: cityNameText
                    font.family: bariol.name
                    text: CityName + " (" + CountryCode + ") "
                    color : "#212121"
                    font.pixelSize: 18
                }

            }

            Row
            {
                id : sunriseSection
                spacing : 10

                Text
                {
                    text : "Sunrise:"
                    font.bold: true
                    font.family: bariol.name
                    font.pixelSize: 18
                }

                Text
                {

                    font.family: bariol.name
                    id : sunriseText
                    text : Sunrise.slice(11,19)
                    font.pixelSize: 18
                }
            }

            Row
            {
                id : sunsetSection
                spacing : 10
                Text
                {
                    text : "Sunset:"
                    font.bold: true
                    font.family: bariol.name
                    font.pixelSize: 18
                }

                Text
                {
                    id : sunsetText
                    font.family: bariol.name
                    text : Sunset.slice(11,19)
                    font.pixelSize: 18

                }
                Button
                {
                    text : "slide"
                    onClicked:
                    {
                        if(mainRec.state === "SLIDED")
                            mainRec.state = ""
                        else
                            mainRec.state = "SLIDED"
                    }
                }
            }
        }

        Row
        {
            spacing : 100
            Image
            {
                id: weatherIcon
                source :
                {
                    if(FirstDayIcon ==="01d")
                        source = "resources/clear_sky_day.png";

                    else if(FirstDayIcon ==="01n")
                        source = "resources/clear_sky_night.png";

                    else if(FirstDayIcon ==="02d")
                        source = "resources/few_clouds_day.png";

                    else if(FirstDayIcon ==="02n")
                        source = "resources/few_clouds_night.png";

                    else if(FirstDayIcon ==="03d")
                        source = "resources/scattered_clouds.png";

                    else if(FirstDayIcon ==="03n")
                        source = "resources/scattered_clouds.png";

                    else if(FirstDayIcon ==="04d")
                        source = "resources/broken_clouds_day.png";

                    else if(FirstDayIcon ==="04n")
                        source = "resources/broken_clouds_night.png";

                    else if(FirstDayIcon ==="09d")
                        source = "resources/shower_rain.png";

                    else if(FirstDayIcon ==="09n")
                        source = "resources/shower_rain.png";

                    else if(FirstDayIcon ==="10d")
                        source = "resources/rain_day.png";

                    else if(FirstDayIcon ==="10n")
                        source = "resources/rain_night.png";

                    else if(FirstDayIcon ==="11d")
                        source = "resources/thunderstorm_day.png";

                    else if(FirstDayIcon ==="11n")
                        source = "resources/thunderstorm_night.png";

                    else if(FirstDayIcon ==="13d")
                        source = "resources/snow.png";

                    else if(FirstDayIcon ==="13n")
                        source = "resources/snow.png";

                    else if(FirstDayIcon ==="50d")
                        source = "resources/mist.png";

                    else if(FirstDayIcon ==="50n")
                        source = "resources/mist.png";
                }

            }

            Column
            {
                spacing : 10
                Text
                {
                    id: weatherStateText
                    text: qsTr(FirstDaySymbol)
                    font.pixelSize: 35
                    font.family: bariol.name
                }


                Row
                {
                    spacing : 20
                    Text
                    {
                        id: temperatureText
                        text: "Temperature:"
                        font.family: bariol.name
                        font.bold: true
                        font.pixelSize: 20
                        color : "#212121"
                    }

                    Text
                    {
                        font.pixelSize: 20
                        anchors.verticalCenter: temperatureText.verticalCenter
                        color : "midnightblue"
                        font.family: bariol.name
                        text:  Math.floor(parseInt(FirstDayDayTemperature)) + "° / " +
                               Math.floor(parseInt(FirstDayNightTemperature)) + "°"
                    }

                }

                Row
                {
                    spacing : 20
                    Text
                    {
                        id: humidityText
                        text: qsTr("Humidity:")
                        font.family: bariol.name
                        font.bold: true
                        font.pixelSize: 20
                        color : "#212121"
                    }

                    Text
                    {
                        anchors.verticalCenter: humidityText.verticalCenter
                        font.pixelSize: 20
                        color : "midnightblue"
                        font.family: bariol.name
                        text: FirstDayHumidity + " %"
                    }

                }


                Row
                {
                    spacing : 20
                    Text
                    {
                        id: windText
                        text: qsTr("Wind speed:")
                        font.family: bariol.name
                        font.bold: true
                        font.pixelSize: 20
                        color : "#212121"
                    }

                    Text
                    {
                        anchors.verticalCenter: windText.verticalCenter
                        font.pixelSize: 20
                        color : "midnightblue"
                        font.family: bariol.name
                        text:
                        {
                            if (FirstDayWindSpeedName === "")
                                text = FirstDayWindSpeed + " mph"
                            else
                                text = FirstDayWindSpeed + " mph" + " / " + FirstDayWindSpeedName
                        }


                    }
                }

                Row
                {
                    spacing : 20
                    Text
                    {
                        id: windDirectionText
                        text: qsTr("Wind direction:")
                        font.family: bariol.name
                        font.bold: true
                        font.pixelSize: 20
                        color : "#212121"
                    }

                    Text
                    {
                        anchors.verticalCenter: windDirectionText.verticalCenter
                        font.pixelSize: 20
                                                color : "midnightblue"
                        font.family: bariol.name
                        text: FirstDayWindDirectionDeg + " °" + " / " + FirstDayWindDirectionCode
                    }
                }


                Row
                {
                    spacing : 20
                    Text
                    {
                        id: pressureText
                        text: qsTr("Pressure:")
                        font.family: bariol.name
                        font.bold: true
                        font.pixelSize: 20
                        color : "#212121"
                    }

                    Text
                    {
                        anchors.verticalCenter: pressureText.verticalCenter
                        font.pixelSize: 20
                        color : "midnightblue"
                        font.family: bariol.name
                        text: FirstDayPressure + " hPa"


                    }
                }

            }
        }


        Row
        {
            spacing : 100
            anchors.horizontalCenter: parent.horizontalCenter
            Column
            {
                id : secondDaySection

                Text
                {
                    id : secondDayName
                    text : Utils.getSecondDayName()
                    font.family: bariol.name
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                Image{
                    width : 100
                    height : 83
                    source :
                    {
                        if(SecondDayIcon ==="01d")
                            source = "resources/clear_sky_day.png";

                        else if(SecondDayIcon ==="01n")
                            source = "resources/clear_sky_night.png";

                        else if(SecondDayIcon ==="02d")
                            source = "resources/few_clouds_day.png";

                        else if(SecondDayIcon ==="02n")
                            source = "resources/few_clouds_night.png";

                        else if(SecondDayIcon ==="03d")
                            source = "resources/scattered_clouds.png";

                        else if(SecondDayIcon ==="03n")
                            source = "resources/scattered_clouds.png";

                        else if(SecondDayIcon ==="04d")
                            source = "resources/broken_clouds_day.png";

                        else if(SecondDayIcon ==="04n")
                            source = "resources/broken_clouds_night.png";

                        else if(SecondDayIcon ==="09d")
                            source = "resources/shower_rain.png";

                        else if(SecondDayIcon ==="09n")
                            source = "resources/shower_rain.png";

                        else if(SecondDayIcon ==="10d")
                            source = "resources/rain_day.png";

                        else if(SecondDayIcon ==="10n")
                            source = "resources/rain_night.png";

                        else if(SecondDayIcon ==="11d")
                            source = "resources/thunderstorm_day.png";

                        else if(SecondDayIcon ==="11n")
                            source = "resources/thunderstorm_night.png";

                        else if(SecondDayIcon ==="13d")
                            source = "resources/snow.png";

                        else if(SecondDayIcon ==="13n")
                            source = "resources/snow.png";

                        else if(SecondDayIcon ==="50d")
                            source = "resources/mist.png";

                        else if(SecondDayIcon ==="50n")
                            source = "resources/mist.png";
                    }
                }


                Text
                {
                    text : SecondDaySymbol
                    font.pixelSize: 20
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }


                Text
                {
                    font.family: bariol.name
                    text :  "<b>Temperature: </b>" + Math.round(parseInt(SecondDayDayTemperature)) + "° / " +Math.round(parseInt( SecondDayNightTemperature)) + "°"
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 15
                }

                Text
                {
                    text : "<b>Humidity: </b>" + SecondDayHumidity + "%"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Wind Speed: </b>" + SecondDayWindSpeed + " hPa"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft

                }
            }


            Column
            {
                id : thirdDaySection
                Text
                {
                    id : thirdDayName
                    text : Utils.getThirdDayName()
                    font.family: bariol.name
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
                Image{
                    width : 100
                    height : 83
                    source :
                    {
                        if(ThirdDayIcon ==="01d")
                            source = "resources/clear_sky_day.png";

                        else if(ThirdDayIcon ==="01n")
                            source = "resources/clear_sky_night.png";

                        else if(ThirdDayIcon ==="02d")
                            source = "resources/few_clouds_day.png";

                        else if(ThirdDayIcon ==="02n")
                            source = "resources/few_clouds_night.png";

                        else if(ThirdDayIcon ==="03d")
                            source = "resources/scattered_clouds.png";

                        else if(ThirdDayIcon ==="03n")
                            source = "resources/scattered_clouds.png";

                        else if(ThirdDayIcon ==="04d")
                            source = "resources/broken_clouds_day.png";

                        else if(ThirdDayIcon ==="04n")
                            source = "resources/broken_clouds_night.png";

                        else if(ThirdDayIcon ==="09d")
                            source = "resources/shower_rain.png";

                        else if(ThirdDayIcon ==="09n")
                            source = "resources/shower_rain.png";

                        else if(ThirdDayIcon ==="10d")
                            source = "resources/rain_day.png";

                        else if(ThirdDayIcon ==="10n")
                            source = "resources/rain_night.png";

                        else if(ThirdDayIcon ==="11d")
                            source = "resources/thunderstorm_day.png";

                        else if(ThirdDayIcon ==="11n")
                            source = "resources/thunderstorm_night.png";

                        else if(ThirdDayIcon ==="13d")
                            source = "resources/snow.png";

                        else if(ThirdDayIcon ==="13n")
                            source = "resources/snow.png";

                        else if(ThirdDayIcon ==="50d")
                            source = "resources/mist.png";

                        else if(ThirdDayIcon ==="50n")
                            source = "resources/mist.png";
                    }
                }

                Text
                {
                    text : ThirdDaySymbol
                    font.pixelSize: 20
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Temperature: </b>" +Math.round(parseInt(ThirdDayDayTemperature)) + "° / " +
                           Math.round(parseInt( ThirdDayNightTemperature)) + "°"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Humidity: </b>" +ThirdDayHumidity + "%"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Wind speed: </b>" +ThirdDayWindSpeed + " hPa"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }
            }



            Column
            {
                id : fourthDaySection
                Text
                {
                    id : fourthDayName
                    text : Utils.getFourthDayName()
                    font.family: bariol.name
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                Image{
                    width : 100
                    height : 83
                    source :
                    {
                        if(FourthDayIcon ==="01d")
                            source = "resources/clear_sky_day.png";

                        else if(FourthDayIcon ==="01n")
                            source = "resources/clear_sky_night.png";

                        else if(FourthDayIcon ==="02d")
                            source = "resources/few_clouds_day.png";

                        else if(FourthDayIcon ==="02n")
                            source = "resources/few_clouds_night.png";

                        else if(FourthDayIcon ==="03d")
                            source = "resources/scattered_clouds.png";

                        else if(FourthDayIcon ==="03n")
                            source = "resources/scattered_clouds.png";

                        else if(FourthDayIcon ==="04d")
                            source = "resources/broken_clouds_day.png";

                        else if(FourthDayIcon ==="04n")
                            source = "resources/broken_clouds_night.png";

                        else if(FourthDayIcon ==="09d")
                            source = "resources/shower_rain.png";

                        else if(FourthDayIcon ==="09n")
                            source = "resources/shower_rain.png";

                        else if(FourthDayIcon ==="10d")
                            source = "resources/rain_day.png";

                        else if(FourthDayIcon ==="10n")
                            source = "resources/rain_night.png";

                        else if(FourthDayIcon ==="11d")
                            source = "resources/thunderstorm_day.png";

                        else if(FourthDayIcon ==="11n")
                            source = "resources/thunderstorm_night.png";

                        else if(FourthDayIcon ==="13d")
                            source = "resources/snow.png";

                        else if(FourthDayIcon ==="13n")
                            source = "resources/snow.png";

                        else if(FourthDayIcon ==="50d")
                            source = "resources/mist.png";

                        else if(FourthDayIcon ==="50n")
                            source = "resources/mist.png";
                    }
                }
                Text
                {
                    text : FourthDaySymbol
                    font.pixelSize: 20
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Temperature: </b>" +Math.round(parseInt(FourthDayDayTemperature)) + "° / " +
                           Math.round(parseInt( FourthDayNightTemperature)) + "°"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Humidity: </b>" +FourthDayHumidity + "%"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Wind speed: </b>" +FourthDayWindSpeed + " hPa"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }
            }



            Column
            {
                id : fifthDaySection

                Text
                {
                    id : fifthDayName
                    text : Utils.getFifthDayName()
                    font.family: bariol.name
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
                Image{
                    width : 100
                    height : 83
                    source :
                    {
                        if(FifthDayIcon ==="01d")
                            source = "resources/clear_sky_day.png";

                        else if(FifthDayIcon ==="01n")
                            source = "resources/clear_sky_night.png";

                        else if(FifthDayIcon ==="02d")
                            source = "resources/few_clouds_day.png";

                        else if(FifthDayIcon ==="02n")
                            source = "resources/few_clouds_night.png";

                        else if(FifthDayIcon ==="03d")
                            source = "resources/scattered_clouds.png";

                        else if(FifthDayIcon ==="03n")
                            source = "resources/scattered_clouds.png";

                        else if(FifthDayIcon ==="04d")
                            source = "resources/broken_clouds_day.png";

                        else if(FifthDayIcon ==="04n")
                            source = "resources/broken_clouds_night.png";

                        else if(FifthDayIcon ==="09d")
                            source = "resources/shower_rain.png";

                        else if(FifthDayIcon ==="09n")
                            source = "resources/shower_rain.png";

                        else if(FifthDayIcon ==="10d")
                            source = "resources/rain_day.png";

                        else if(FifthDayIcon ==="10n")
                            source = "resources/rain_night.png";

                        else if(FifthDayIcon ==="11d")
                            source = "resources/thunderstorm_day.png";

                        else if(FifthDayIcon ==="11n")
                            source = "resources/thunderstorm_night.png";

                        else if(FifthDayIcon ==="13d")
                            source = "resources/snow.png";

                        else if(FifthDayIcon ==="13n")
                            source = "resources/snow.png";

                        else if(FifthDayIcon ==="50d")
                            source = "resources/mist.png";

                        else if(FifthDayIcon ==="50n")
                            source = "resources/mist.png";
                    }
                }
                Text
                {
                    text : FifthDaySymbol
                    font.pixelSize: 20
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    id : fifthDayTemperatureText
                    text : "<b>Temperature: </b>" +Math.round(parseInt(FifthDayDayTemperature)) + "° / " +
                           Math.round(parseInt( FifthDayNightTemperature)) + "°"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Humidity: </b>" +FifthDayHumidity + "%"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }

                Text
                {
                    text : "<b>Wind speed: </b>" +FifthDayWindSpeed + " hPa"
                    font.pixelSize: 15
                    font.family: bariol.name
                    width : parent.width
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }
    }

    }


    Rectangle
{
    id : controlPanel
    anchors.left: mainRec.right
    width : 300
    height : mainRec.height
    z : 10
    color : "gray"
    Column
    {
        Text
        {
            id : controlPanelTitle
            text : "Control panel"
            font.pixelSize: 35
            font.family: bariol.name
            color : "white"
            font.bold: true
        }


        Text
        {
            text : "Choose a city:"
            color : "white"
            font.family: bariol.name
            font.pixelSize: 15
        }

        Row
        {

            TextInput
            {
                //color : "white"
                id : cityNameTextInput
                width : 200
                height : 50
                color: "#ffffff"
                cursorVisible: true
                selectByMouse: true

            }
            Button
            {
                text : "OK"
                onClicked:
                {
                    weatherDataModel.source = "http://api.openweathermap.org/data/2.5/forecast/daily?q="+cityNameTextInput.text+"&mode=xml&units=metric&cnt=5"
                }
            }
        }

        Text
        {
            text : "Temperature Unit:"
            color : "white"
            font.family: bariol.name
            font.pixelSize: 15
        }

        Row
        {
             ExclusiveGroup { id: temperatureUnitGroup }
            RadioButton
            {
                id : celciusRadioButton
                exclusiveGroup : temperatureUnitGroup
                text : "Celcius"
            }
            RadioButton
            {
                id : fahrenheitRadioButton
                exclusiveGroup : temperatureUnitGroup
                text : "Fahrenheit"
                onCheckedChanged:
                {
                    if(fahrenheitRadioButton.checked)
                    {
                        //fifthDayTemperatureText.text = "<b>Temperature: </b>" +Math.round(Utils.toFahrenheit(parseInt(FifthDayDayTemperature))) + "° / " +
                          //      Math.round(Utils.toFahrenheit(parseInt( FifthDayNightTemperature))) + "°"
                    }
                }
            }

            Button
            {
                id : temperatureUnitButton
                text : "OK"
                onClicked:
                {
                    if(celciusRadioButton.checked)
                    {

                    }

                    else if(fahrenheitRadioButton.checked)
                    {

                    }
                }
            }

        }


    }
}


}




