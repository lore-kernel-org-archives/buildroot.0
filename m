From: Timo Ketola <timo.ketola@exertus.fi>
Date: Mon, 12 Jul 2021 11:13:32 +0300
Subject: [Buildroot] [PATCH] package/fbgrab: bump to version 1.5
In-Reply-To: <20210710191550.13589-1-texier.pj2@gmail.com>
References: <20210710191550.13589-1-texier.pj2@gmail.com>
Message-ID: <af7f6691-ce89-7047-10e2-e2d4c5bd5d5e@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10.7.2021 22.15, Pierre-Jean Texier wrote:
> See changelog: https://github.com/GunnarMonell/fbgrab/releases/tag/1.5
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

Tested-by: Timo Ketola <timo.ketola@exertus.fi>
Acked-by: Timo Ketola <timo.ketola@exertus.fi>

Thanks for taking care of this.

> ---
>  package/fbgrab/fbgrab.hash | 2 +-
>  package/fbgrab/fbgrab.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
> index 4d9a6b97d4..8cd1ff1518 100644
> --- a/package/fbgrab/fbgrab.hash
> +++ b/package/fbgrab/fbgrab.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  62d7aa82138ac36db0921832f3b5267b4cffc0dc22c8701857ebcb997960a32e  fbgrab-1.4.tar.gz
> +sha256  0202a9c4fb430eee4d8f566d09ab5f6e35c50804a192ba106046e54eb886f8f1  fbgrab-1.5.tar.gz
>  sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
> diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
> index 1ae03ae43f..693c4c282d 100644
> --- a/package/fbgrab/fbgrab.mk
> +++ b/package/fbgrab/fbgrab.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FBGRAB_VERSION = 1.4
> +FBGRAB_VERSION = 1.5
>  FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
>  FBGRAB_DEPENDENCIES = libpng
>  FBGRAB_LICENSE = GPL-2.0
> 

-- 
Create smart solutions with us!

+------------------------------------------------+
| Timo Ketola            | Exertus Oy            |
| Specialist,            | Kampusranta 9C        |
|       FW & Electronics | 60320 Sein?joki       |
| +358 40 5311 244       | Finland               |
| timo.ketola at exertus.fi | http://www.exertus.fi |
+------------------------+-----------------------+
| /"\                                            |
| \ / ASCII RIBBON CAMPAIGN AGAINST HTML MAIL    |
|  X  http://www.asciiribbon.org/                |
| / \                                            |
+------------------------------------------------+
