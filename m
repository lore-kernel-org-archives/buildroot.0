From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:21:22 +0200
Subject: [Buildroot] [PATCH 1/2] sdl2_gfx: bump to version 1.0.4
In-Reply-To: <20190923231543.21874-1-peter.macleod.thompson@gmail.com>
References: <20190923231543.21874-1-peter.macleod.thompson@gmail.com>
Message-ID: <20190927232122.1de1d7bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 17:15:42 -0600
Peter Thompson <peter.macleod.thompson@gmail.com> wrote:

> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> bump sdl2_gfx from version 1.0.1 to 1.0.4 to upgrade to most recent version
> 
> Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_gfx/sdl2_gfx.hash | 4 ++--
>  package/sdl2_gfx/sdl2_gfx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2_gfx/sdl2_gfx.hash b/package/sdl2_gfx/sdl2_gfx.hash
> index 4cb07ee935..eacb2fa422 100644
> --- a/package/sdl2_gfx/sdl2_gfx.hash
> +++ b/package/sdl2_gfx/sdl2_gfx.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated
> -sha256 d69bcbceb811b4e5712fbad3ede737166327f44b727f1388c32581dbbe8c599a  SDL2_gfx-1.0.1.tar.gz
> +# Locally calculated 

You introduced a trailing white space here.

I fixed that, adjust the commit title to use package/sdl2_gfx as the
prefix, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
