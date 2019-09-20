<%@ include file="/init.jsp" %>
<style>
.fondo{
	height: 50rem;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: top center;
    position: relative;
}
.bd{
	border: 1px solid #d0b36f;
    width: max-content;
    padding: 6px 15px;
    position: relative;
    top: 10rem;
    left: 2rem;
}
.sh{
	line-height: .5rem;
}
.parr{
	margin-top: 2.5rem;
}
</style>
			<div class="fondo" style='background: url("<%=request.getContextPath()+"/img/ircuervo.jpg"%>")'>
			    <div class="bd">
				    <h2 style="width: 300px;
				    text-align: center;">STOCK PRICE</h2>
				    <h1 style="width: 100%;
				    text-align: center;color: #d0b36f;line-height: 1.5rem;">$ 29.01</h1>
				    <div class="parr">
				    	<p class="sh"><b>Exchange:</b> MXN</p>
					    <p class="sh"><b>Change %:</b> -0.01 -(0.03%)</p>
					    <p class="sh"><b>Updated:</b> Sep 18, 2019 1:00 PM EDT</p>
				    </div> 
				    <p style="margin-top: 1.4rem;" >20 minutes delay</p>
			    </div>
			</div>

