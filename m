From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Oct 2015 16:14:06 +0100
Subject: [Buildroot] [PATCH] dropbear: bump to 2015.68
In-Reply-To: <1444913378-32592-1-git-send-email-luca@lucaceresoli.net>
References: <1444913378-32592-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <561FC2BE.6070809@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On 10/15/2015 01:49 PM, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^DROPBEAR_VERSION package/dropbear/dropbear.mk
DROPBEAR_VERSION = 2015.68

$ file output/target/usr/sbin/dropbear
output/target/usr/sbin/dropbear: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 30856cc..981bb1d 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,2 +1,2 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256	7e690594645dfde5787065c78a5d2e4d15e288babfa06e140197ce05f698c8e5	dropbear-2015.67.tar.bz2
> +sha256	55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446  dropbear-2015.68.tar.bz2
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index aa3fd9d..57c1b5c 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2015.67
> +DROPBEAR_VERSION = 2015.68
>  DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
> 
