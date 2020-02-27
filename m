From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 23:28:17 +0100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Add myself to
 package/gnuplot, sdl2
In-Reply-To: <20200227103055.3704-1-mf@go-sys.de>
References: <20200227103055.3704-1-mf@go-sys.de>
Message-ID: <20200227232817.2255be65@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 11:30:55 +0100
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  DEVELOPERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7d3d1ca11a..e56f8d57c6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2646,3 +2646,7 @@ F:	package/qjson/
>  F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/tinc/
> +
> +N:	Michael Fischer <mf@go-sys.de>
> +F:	package/gnuplot/
> +F:	package/sdl2/

The file is ordered alphabetically, so I fixed that and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
