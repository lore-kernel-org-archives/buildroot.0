From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:43:21 +0200
Subject: [Buildroot] [PATCH] package/glmark2: bump to the latest version
In-Reply-To: <20200921131101.15085-1-festevam@gmail.com>
References: <20200921131101.15085-1-festevam@gmail.com>
Message-ID: <20200921224321.5ed15ea7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 10:11:01 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Current version does not run on imx6 and fails like this:
> 
> Error: eglCreateWindowSurface failed with error: 0x3009
> Error: eglCreateWindowSurface failed with error: 0x3009
> Error: CanvasGeneric: Invalid EGL state
> Error: main: Could not initialize canvas
> 
> Bumping to the latest version fixes this problem.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/glmark2/glmark2.hash | 2 +-
>  package/glmark2/glmark2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
> index ffd1ba2d50..33a99de12a 100644
> --- a/package/glmark2/glmark2.hash
> +++ b/package/glmark2/glmark2.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  6a9de46c098406895411b629fe8fadfdce92360500f0f10e4cc60a889a1692eb  glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e.tar.gz
> +sha256  9ad57e4eec0049c47a367b57f5f8d3e31e4c488b1d5d6673a75f1b2282e40888  glmark2-c493520253fbfe3676c8b34b6f91a7c9a838fc8e.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index 3d31003d06..ec62faada2 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLMARK2_VERSION = 9e01aef1a786b28aca73135a5b00f85c357e8f5e
> +GLMARK2_VERSION = c493520253fbfe3676c8b34b6f91a7c9a838fc8e
>  GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
>  GLMARK2_LICENSE = GPL-3.0+, SGIv1
>  GLMARK2_LICENSE_FILES = COPYING COPYING.SGI



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
