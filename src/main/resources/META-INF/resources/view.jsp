<%@ include file="/init.jsp" %>
<link rel="stylesheet" type="text/css" href='<%=request.getContextPath()+"/css/irCuervo.css"%>'>
	<div id="opaci">
		<div class="fondo" style='background: url("<%=request.getContextPath()+"/img/ircuervo.jpg"%>")' >
		</div>
			<div class="bd">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-3">
						<div class="decora">
							<div class="cen">
								<h2 style="width: 100%;font-family: Work Sans;font-weight: 600;text-align: center;text-transform: uppercase;">STOCK PRICE</h2>
						    	<h1 style="width: 100%;text-align: center;color: #d0b36f;font-size: 2.5em;line-height: 1.5rem;font-weight: 500;font-family: Work Sans;"><span id="price"></span></h1>
						    	<div class="parr">
						    		<p class="sh"><strong>Exchange:</strong><span>MXN</span></p>
							    	<p class="sh"><strong>Change %:</strong><span id="change"></span></p>
							    	<p id="fecha" class="sh"><strong>Updated:</strong><span id="last-update"></span> </p>
						    	</div> 
						    	<small id="time" style="margin-top: 1.4rem;margin-bottom: .3rem;" >20 minutes delay</small>
						    </div>
						</div>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<hgroup class="mt-50" style="border-left: solid 1px #d0b370;padding-left: .5rem;">
							<h6>Conoce nuestros resultados</h6>
							<h6>financieros <a target="_blank" style="color: #d0b36f" href="https://ircuervo.com/es/ir/reporting-center/"><u>aquí</u></a></h6>
						</hgroup>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 mt-50">
						<hgroup style="margin-top: 6rem">
							<h6 class="text-right">Para más información contacta a:</h6>
							<h6 class="text-right font-weight-light">Alfredo Rubio alrubio@cuervo</h6>
						</hgroup>
					</div>
				</div>
			</div>
			
	</div>
	
<script>

	$(document)

			.ready(

					function() {

						$

								.ajax({

									url : "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=15min&symbol=CUERVO.MX&apikey=J8OCON8X4HSXL9KS",

									method : "get",

									success : function(data) {
									
										var date = new Date(data["Meta Data"]["3. Last Refreshed"]);
										
										var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
										
										function formatAMPM(date) {
											  var hours = date.getHours();
											  var minutes = date.getMinutes();
											  var ampm = hours >= 12 ? 'pm' : 'am';
											  hours = hours % 12;
											  hours = hours ? hours : 12; // the hour '0' should be '12'
											  minutes = minutes < 10 ? '0'+minutes : minutes;
											  var strTime = hours + ':' + minutes + ' ' + ampm;
											  return strTime;
											}
 
											console.log(formatAMPM(new Date(data["Meta Data"]["3. Last Refreshed"])));
									//	return $("#last-update").html(moment(data["Meta Data"]["3. Last Refreshed"]).format('lll') + " EDT");
										return $("#last-update").html(months[date.getMonth()]+" "+ date.getDate()+", "+ date.getFullYear()+" "+formatAMPM(new Date(data["Meta Data"]["3. Last Refreshed"]))+ " EDT");
									}

								});

						$

								.ajax({

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
										/*	console.log(moment(

													data["Meta Data"]["3. Last Refreshed"])

													.date());*/

											/*if (moment(k).date() !== moment(

													data["Meta Data"]["3. Last Refreshed"])

													.date()) {

												quotes[1] = data["Time Series (Daily)"][k];

												console.log('BEFORE BREAK');

												console.log(quotes[1]);

												break;

											}*/
											if (mydate.getDate() !== mydate2.getDate()) {
												quotes[1] = data["Time Series (Daily)"][k];
												break;
											}

										}
										variation = parseFloat(quotes[0]["4. close"])

												- parseFloat(quotes[1]["4. close"]);

										percent = (variation / parseFloat(quotes[1]["4. close"])) * 100;

										$("#change").html(

												variation.toFixed(2) + "("

														+ percent.toFixed(2)

														+ "%)");

										return $("#price").html("$"+ parseFloat(quotes[0]["4. close"]).toFixed(2));
									}

								});

					});

</script>

