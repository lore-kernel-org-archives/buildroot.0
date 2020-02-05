From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 5 Feb 2020 16:16:59 +0100
Subject: [Buildroot] [PATCH] docs/website: add commercial support
 section with Mind
In-Reply-To: <20200205150842.3511395-1-arnout@mind.be>
References: <20200205150842.3511395-1-arnout@mind.be>
Message-ID: <271ecf95-74c7-d1bf-82e2-adccba2770c1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 05/02/2020 ? 16:08, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> Add a section to the support page for commercial support.
> 
> Add Mind, Bootlin and Smile in that section.

The title of the commit only list Mind. Bootlin and Smile must be added :)

Acked-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/website/support.html | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 1a5ce9e225..6c602b42d2 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -92,6 +92,31 @@
>      </div>
>    </div>
>  
> +  <div class="panel panel-primary">
> +    <div class="panel-heading">Commercial support</div>
> +    <div class="panel-body">
> +      <p>In addition, the following companies are able to provide commercial
> +	 support. Only companies heavily involved in Buildroot maintenance and
> +	 community are listed here.</p>
> +
> +      <div class="row">
> +	<div class="col-sm-12">
> +	  <center>
> +	    <a href="https://bootlin.com/engineering/">
> +	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
> +	    </a>
> +	    <a href="https://mind.be/services/buildroot.html">
> +	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
> +	    </a>
> +	    <a href="https://www.smile.eu/en/offers/embedded-iot">
> +	      <img src="images/smile-logo.png" style="max-width:200px; margin-right:40px;"/>
> +	    </a>
> +	  </center>
> +	</div>
> +      </div>
> +    </div>
> +  </div>
> +
>  </div><!--/.col-sm-10 -->
>  </div><!--/.row -->
>  </div>
> 
