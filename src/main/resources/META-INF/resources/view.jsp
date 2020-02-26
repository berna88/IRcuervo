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
							<h6>financieros <a target="_blank" style="color: #d0b36f" href="https://ircuervo.com/es/ir/reporting-center/">aquí.</a></h6>
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
<script src='<%=request.getContextPath()+"/js/ircuervo.js" %>'></script>

