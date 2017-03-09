From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 9 Mar 2017 08:53:30 +0100
Subject: [Buildroot] [PATCH 2/2] ti-uim: bump to latest version
In-Reply-To: <075bbc11df38f8280c99d15834ec461dad0d6654.1489038337.git.baruch@tkos.co.il>
References: <af8528c725dbee3b80a8a99b2adba50a6ff4114d.1489038337.git.baruch@tkos.co.il>
 <075bbc11df38f8280c99d15834ec461dad0d6654.1489038337.git.baruch@tkos.co.il>
Message-ID: <20170309075330.vauudriqhipx3cq2@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/2017 at 07:45:37 +0200, Baruch Siach wrote:
> Also, add a hash file.
> 
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

BTW, I don't think this daemon is necessary anymore with recent kernel
but I don't exactly remember all the details.

> ---
>  package/ti-uim/ti-uim.hash | 2 ++
>  package/ti-uim/ti-uim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/ti-uim/ti-uim.hash
> 
> diff --git a/package/ti-uim/ti-uim.hash b/package/ti-uim/ti-uim.hash
> new file mode 100644
> index 000000000000..ea64540ba81f
> --- /dev/null
> +++ b/package/ti-uim/ti-uim.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 da8a66968f4bf99366ab2b63baf358d937a6b1a5636ef6179c3aa7c852cbd1b2 ti-uim-a0236bc252e6484835ce266ae4a50b361f6a902d.tar.gz
> diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
> index 1c78db0e6f01..a6e19b87ca9a 100644
> --- a/package/ti-uim/ti-uim.mk
> +++ b/package/ti-uim/ti-uim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
> +TI_UIM_VERSION = a0236bc252e6484835ce266ae4a50b361f6a902d
>  TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
>  TI_UIM_LICENSE = GPLv2+
>  
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
