From: Alexander Dahl <post@lespocky.de>
Date: Thu, 20 Jul 2017 21:57:14 +0200
Subject: [Buildroot] [PATCH] putty: bump to version 0.70
In-Reply-To: <b2ac59e7b72811c01b4f352bb1c75e0156230a50.1500573837.git.baruch@tkos.co.il>
References: <b2ac59e7b72811c01b4f352bb1c75e0156230a50.1500573837.git.baruch@tkos.co.il>
Message-ID: <20170720195714.GD1946@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

I saw the Changelog from 0.69 to 0.70, those where mostly changes for
Windows. You may add:

Acked-by: Alexander Dahl <post@lespocky.de>

Greets
Alex

On Thu, Jul 20, 2017 at 09:03:57PM +0300, Baruch Siach wrote:
> Cc: Alexander Dahl <post@lespocky.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/putty/putty.hash | 6 +++---
>  package/putty/putty.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/putty/putty.hash b/package/putty/putty.hash
> index 23c6b3d0ede7..e0527105c1d4 100644
> --- a/package/putty/putty.hash
> +++ b/package/putty/putty.hash
> @@ -1,3 +1,3 @@
> -# Hashes from: http://the.earth.li/~sgtatham/putty/0.68/{sha256,sha512}sums
> -sha256 7ba256f46e5a353cafe811ce7914d0e22a52bdfc0e6e2d183ad28b5af44cd09c                                                                 putty-0.68.tar.gz
> -sha512 e3a6e4f45e1fce70d4cbb6d4769ab72b23c10920e48a88bba95b3f4c225b0193ddc1444e69d572bdec5e505d2c56fed365f07d990c156b35f272b56f978ef5d3 putty-0.68.tar.gz
> +# Hashes from: http://the.earth.li/~sgtatham/putty/0.70/{sha256,sha512}sums
> +sha256 bb8aa49d6e96c5a8e18a057f3150a1695ed99a24eef699e783651d1f24e7b0be                                                                 putty-0.70.tar.gz
> +sha512 2aaf4fa2b4ad2d82eb5cdc4419ade79e0c5d8bd3c093db92b3c048e6107f85a5f1647f9d8203cda0906ce2b926725a75319f981cb32e6f1ebf50b1f738564fed putty-0.70.tar.gz
> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
> index a2a731e3ab6c..52f2d4c3dd36 100644
> --- a/package/putty/putty.mk
> +++ b/package/putty/putty.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PUTTY_VERSION = 0.68
> +PUTTY_VERSION = 0.70
>  PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
>  PUTTY_SUBDIR = unix
>  PUTTY_LICENSE = MIT
> -- 
> 2.13.2

-- 
?With the first link, the chain is forged. The first speech censured, 
the first thought forbidden, the first freedom denied, chains us all 
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/4e4e169b/attachment.asc>
