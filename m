From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:48:39 +0200
Subject: [Buildroot] [PATCH] pdbg: Bump version to v2.4
In-Reply-To: <20191018121135.5987-1-joel@jms.id.au>
References: <20191018121135.5987-1-joel@jms.id.au>
Message-ID: <38b13a36-6a46-46bf-1327-efadb46d3fa5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/10/2019 14:11, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/pdbg/pdbg.hash | 2 +-
>  package/pdbg/pdbg.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
> index 68c7735e19d7..486dff240d52 100644
> --- a/package/pdbg/pdbg.hash
> +++ b/package/pdbg/pdbg.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 dffeb0774dd2600b384bb42903fbbbff1396eb078f3430d129fec10ca194a4bb pdbg-2.3.tar.gz
> +sha256 10f701c4bb8557a35de166c4322d77fa64ddbdd1146141a88a3d530144545820 pdbg-2.4.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
> diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
> index 52eaddb0b436..1832e235ec8d 100644
> --- a/package/pdbg/pdbg.mk
> +++ b/package/pdbg/pdbg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PDBG_VERSION = 2.3
> +PDBG_VERSION = 2.4
>  PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
>  PDBG_LICENSE = Apache-2.0
>  PDBG_LICENSE_FILES = COPYING
> 
