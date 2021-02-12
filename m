From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Feb 2021 22:24:29 +0100
Subject: [Buildroot] [PATCH] docs/website: mention Bootlin Buildroot
 training courses
In-Reply-To: <20210211150502.2784827-1-thomas.petazzoni@bootlin.com>
References: <20210211150502.2784827-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210212212429.GM1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-11 16:05 +0100, Thomas Petazzoni spake thusly:
> Our documentation page already mentions the open-source and freely
> available training materials from Bootlin on Buildroot.
> 
> It turns out that we now have online training courses accessible to
> public registration, which makes them accessible to a wider
> audience. It probably makes sense to mention them alongside the
> training materials.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/website/docs.html | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/website/docs.html b/docs/website/docs.html
> index 9ef202ff9d..c619c16fa6 100644
> --- a/docs/website/docs.html
> +++ b/docs/website/docs.html
> @@ -106,6 +106,18 @@
>  	      </ul>
>  	    </div>
>  	  </div>
> +
> +	  <div class="panel panel-default">
> +	    <div class="panel-heading">Public training course</div>
> +	    <div class="panel-body">
> +	      The next online public training course on Buildroot
> +	      organized
> +	      by <a href="https://www.bootlin.com">Bootlin</a> will
> +	      take place on March 8-11, 2021, with Thomas Petazzoni as
> +	      trainer. <a href="https://bootlin.com/training/buildroot/">Infos</a>
> +	      and <a href="https://www.eventbrite.fr/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-108855638144">registration</a>.
> +	    </div>
> +	  </div>
>  	</div>
>        </div>
>      </div>
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
