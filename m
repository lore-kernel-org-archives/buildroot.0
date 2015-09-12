From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:26:04 +0100
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55F3EFAC.7060306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/09/15 23:24, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ grep ^LIBTASN1_VERSION package/libtasn1/libtasn1.mk
LIBTASN1_VERSION = 4.6

$ file output/target/usr/bin/asn1Coding
output/target/usr/bin/asn1Coding: ELF 32-bit MSB executable, MIPS, 
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for 
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with 
unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
>   package/libtasn1/libtasn1.hash | 2 +-
>   package/libtasn1/libtasn1.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
> index 653e018..41e10a6 100644
> --- a/package/libtasn1/libtasn1.hash
> +++ b/package/libtasn1/libtasn1.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated after checking pgp signature
> -sha256	89b3b5dce119273431544ecb305081f3530911001bb12e5d76588907edb71bda	libtasn1-4.5.tar.gz
> +sha256	3462fc25e2d2536878c39a8825f5e36ba2e2611b27ef535e064f4c56258e508b	libtasn1-4.6.tar.gz
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index eeff76c..6818f30 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBTASN1_VERSION = 4.5
> +LIBTASN1_VERSION = 4.6
>   LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
>   LIBTASN1_DEPENDENCIES = host-bison
>   LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
>
