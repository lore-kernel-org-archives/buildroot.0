From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 10:47:03 +0000
Subject: [Buildroot] [PATCH] busybox: bump to version 1.24.1
In-Reply-To: <1446115231-4451-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446115231-4451-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5631F927.7060502@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/29/2015 10:40 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -R "^BUSYBOX_VERSION" package/busybox/busybox.mk
BUSYBOX_VERSION = 1.24.1

$ file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0xf41 = 0x756e6700, with
unknown capability 0x70100 = 0x1040000, stripped

Regards,

Vincent.

> ---
>  package/busybox/busybox.hash | 6 +++---
>  package/busybox/busybox.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
> index 1a9b2ff..99fb8e4 100644
> --- a/package/busybox/busybox.hash
> +++ b/package/busybox/busybox.hash
> @@ -1,3 +1,3 @@
> -# From http://busybox.net/downloads/busybox-1.24.0.tar.bz2.sign
> -md5 2fa3110042e518e0e1225c799294664c  busybox-1.24.0.tar.bz2
> -sha1 238a9b8a66c31fdcdd00790a840ef03cc77482c7  busybox-1.24.0.tar.bz2
> +# From http://busybox.net/downloads/busybox-1.24.1.tar.bz2.sign
> +md5 be98a40cadf84ce2d6b05fa41a275c6a  busybox-1.24.1.tar.bz2
> +sha1 157d14d24748b4505b1a418535688706a2b81680  busybox-1.24.1.tar.bz2
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index e5427cf..7f6dbd6 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUSYBOX_VERSION = 1.24.0
> +BUSYBOX_VERSION = 1.24.1
>  BUSYBOX_SITE = http://www.busybox.net/downloads
>  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
>  BUSYBOX_LICENSE = GPLv2
> 
