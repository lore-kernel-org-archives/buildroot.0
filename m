From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:25:59 +0100
Subject: [Buildroot] [PATCH 2/2] conntrack-tools: bump to version 1.4.3
In-Reply-To: <1442006582-20537-2-git-send-email-gustavo@zacarias.com.ar>
References: <1442006582-20537-1-git-send-email-gustavo@zacarias.com.ar>
 <1442006582-20537-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55F3EFA7.7080003@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/09/15 22:23, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ grep ^CONNTRACK_TOOLS_VERSION package/conntrack-tools/conntrack-tools.mk
CONNTRACK_TOOLS_VERSION = 1.4.3

$ file output/target/usr/sbin/conntrack
output/target/usr/sbin/conntrack: ELF 32-bit MSB executable, MIPS, 
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for 
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with 
unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.
> ---
>   package/conntrack-tools/conntrack-tools.hash | 6 +++---
>   package/conntrack-tools/conntrack-tools.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
> index ecb0811..7ff1cf7 100644
> --- a/package/conntrack-tools/conntrack-tools.hash
> +++ b/package/conntrack-tools/conntrack-tools.hash
> @@ -1,3 +1,3 @@
> -# From ftp://ftp.netfilter.org/pub/conntrack-tools/conntrack-tools-1.4.2.tar.bz2.{md5sum,sha1sum}
> -md5	b1f9d006e7bf000a77395ff7cd3fac16	conntrack-tools-1.4.2.tar.bz2
> -sha1	50b89305bb689973d42a163c480dc77a5c0f6fe0	conntrack-tools-1.4.2.tar.bz2
> +# From ftp://ftp.netfilter.org/pub/conntrack-tools/conntrack-tools-1.4.3.tar.bz2.{md5sum,sha1sum}
> +md5	966a5d8f846ddf5304bcd12685c0707f	conntrack-tools-1.4.3.tar.bz2
> +sha1	509db30f34b283f4a74a7e638ba0ca713d3fe98c	conntrack-tools-1.4.3.tar.bz2
> diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
> index 983f954..eac5841 100644
> --- a/package/conntrack-tools/conntrack-tools.mk
> +++ b/package/conntrack-tools/conntrack-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -CONNTRACK_TOOLS_VERSION = 1.4.2
> +CONNTRACK_TOOLS_VERSION = 1.4.3
>   CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
>   CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
>   CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
>
