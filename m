From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 22:14:24 +0100
Subject: [Buildroot] [PATCH] docs/website: adjust link to Buildroot
 training course
In-Reply-To: <20210312105024.155308-1-thomas.petazzoni@bootlin.com>
References: <20210312105024.155308-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210312211424.GB2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-12 11:50 +0100, Thomas Petazzoni spake thusly:
> The previous course has ended, announce the next one.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

However, I believe that we can't endlessly carry this always-changing
registration information.

The registration information is already present on your generic training
page, https://bootlin.com/training/buildroot/ , which we also link, and
which I believe you already keep up to date.

So, what I suggest we carry, is a slightly rephrased blurb, like
(markdown-style for ease of readbility):

    Bootlin organises recurring [public training courses on
    Buildroot](https://bootlin.com/training/buildroot/), with
    Thomas Petazzoni as trainer.

Thoughts?

Regards,
Yann E. MORIN.

> ---
>  docs/website/docs.html | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/website/docs.html b/docs/website/docs.html
> index c619c16fa6..e8d8138565 100644
> --- a/docs/website/docs.html
> +++ b/docs/website/docs.html
> @@ -113,9 +113,9 @@
>  	      The next online public training course on Buildroot
>  	      organized
>  	      by <a href="https://www.bootlin.com">Bootlin</a> will
> -	      take place on March 8-11, 2021, with Thomas Petazzoni as
> +	      take place from May 31 to June 4, 2021, with Thomas Petazzoni as
>  	      trainer. <a href="https://bootlin.com/training/buildroot/">Infos</a>
> -	      and <a href="https://www.eventbrite.fr/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-108855638144">registration</a>.
> +	      and <a href="https://www.eventbrite.com/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-145276318379">registration</a>.
>  	    </div>
>  	  </div>
>  	</div>
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
