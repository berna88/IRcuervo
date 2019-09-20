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
				</div>	    
			</div>
	</div>
	
<script src="https://ircuervo.com/js/vendor-2608cf24.js">
	
</script>

<script>
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=15min&symbol=CUERVO.MX&apikey=J8OCON8X4HSXL9KS",
									method : "get",
									success : function(data) {
										return $("#last-update").html(moment(data["Meta Data"]["3. Last Refreshed"]).format('lll') + " EDT");
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
											if (moment(k).date() !== moment(
													data["Meta Data"]["3. Last Refreshed"])
													.date()) {
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
										return $("#price")
												.html(
														"$"
																+ parseFloat(
																		quotes[0]["4. close"])
																		.toFixed(
																				2));
									}
								});
					});
</script>

