class Weather{
  var cityName;
  var temp;
  var wind;
  var humidity;
  var feels_like;
  var pressure;

  Weather(
      {this.cityName,
      this.temp,
        this.wind,
        this.humidity,
        this.feels_like,
        this.pressure}
      );
  Weather.fromJson(Map<String,dynamic> json){
    cityName=json['name'];
    temp=json['main']['temp'];
    wind=json['wind']['speed'];
    pressure=json['main']['pressure'];
    humidity=json['main']['humidity'];
    feels_like=json['main']['feels_like'];
  }
}