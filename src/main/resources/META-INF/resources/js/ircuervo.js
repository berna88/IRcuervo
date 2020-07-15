$(document)
			.ready(
					function() {
						$.ajax({
									url : "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=15min&symbol=CUERVO.MX&apikey=J8OCON8X4HSXL9KS",
									method : "get",
									success : function(data) {
										console.log('Hola data');
										console.log(data);
										console.log(data["Meta Data"]["3. Last Refreshed"]);
										//var date = new Date(data["Meta Data"]["3. Last Refreshed"]);
										var fechaString = data["Meta Data"]["3. Last Refreshed"];
										var date = new Date('2017-11-14 20:00:00'.replace(/\s/, 'T'));
										console.log('Hola date');
										console.log(date);
										var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];						
										function formatAMPM(date) {
											  var hours = date.getHours();
											  var minutes = date.getMinutes();
											  var ampm = hours >= 12 ? 'pm' : 'am';
											  hours = hours % 12;
											  hours = hours ? hours : 12; // the hour '0' should be '12'
											  minutes = minutes < 10 ? '0'+minutes : minutes;
											  var strTime = hours + ':' + minutes + ' ' + ampm;
											  console.log('Bernardo');
											  console.log(strTime);
											  return strTime;
											}
										console.log(date.getMonth());
										console.log(date.getDate());
										
										return $("#last-update").html(months[date.getMonth()]+" "+ date.getDate()+", "+ date.getFullYear()+" "+formatAMPM(new Date(data["Meta Data"]["3. Last Refreshed"]))+ " EDT");
									}
								});

						$.ajax({

									url : "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=CUERVO.MX&apikey=J8OCON8X4HSXL9KS",
									method : "get",
									success : function(data) {
										var k, percent, quotes, ref, v, variation;
										quotes = [];
										quotes[0] = data["Time Series (Daily)"][data["Meta Data"]["3. Last Refreshed"]];
										ref = data["Time Series (Daily)"];
										for (k in ref) {
											v = ref[k];
											var parts =k.split('-');
											var mydate = new Date(parts[0], parts[1] - 1, parts[2]); 						
											var d = data["Meta Data"]["3. Last Refreshed"];
											var parts2 =d.split('-');
											var mydate2 = new Date(parts2[0], parts2[1] - 1, parts2[2]); 
											if (mydate.getDate() !== mydate2.getDate()) {
												quotes[1] = data["Time Series (Daily)"][k];
												break;
											}
										}
										variation = parseFloat(quotes[0]["4. close"]) - parseFloat(quotes[1]["4. close"]);
										percent = (variation / parseFloat(quotes[1]["4. close"])) * 100;
										$("#change").html(
												variation.toFixed(2) + "("
														+ percent.toFixed(2)
														+ "%)");
										return $("#price").html("$"+ parseFloat(quotes[0]["4. close"]).toFixed(2));
									}

								});

					});