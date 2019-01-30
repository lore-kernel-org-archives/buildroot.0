From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2019 18:15:32 +0200
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.2
In-Reply-To: <20190130153958.16876815F5@busybox.osuosl.org>
References: <20190130153958.16876815F5@busybox.osuosl.org>
Message-ID: <20190130161532.4xw5yhc2zdhadz77@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Jan 30, 2019 at 04:40:52PM +0100, Peter Korsgaard wrote: 
> diff --git a/Makefile b/Makefile
> index 998b571071..6379d069d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -92,7 +92,7 @@ all:
>  .PHONY: all
>  
>  # Set and export the version string
> -export BR2_VERSION := 2018.11.1
> +export BR2_VERSION := 2018.11.2
>  # Actual time the release is cut (for reproducible builds)
>  BR2_VERSION_EPOCH = 1545257000

What about BR2_VERSION_EPOCH update?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
