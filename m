From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 22:51:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2016.01
In-Reply-To: <1452980355-20322-1-git-send-email-joerg.krause@embedded.rocks>
References: <1452980355-20322-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <569ABB4F.3050905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-01-16 22:39, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 Maybe add

Fixes
http://autobuild.buildroot.net/results/9ebc5e3a6f1dd3ceb90d6786a1c5455c965f819e


> ---
>  package/uboot-tools/uboot-tools.hash | 2 +-
>  package/uboot-tools/uboot-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
> index 65a5261..31b0db9 100644
> --- a/package/uboot-tools/uboot-tools.hash
> +++ b/package/uboot-tools/uboot-tools.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256	bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
> +sha256  e5792fba9399d9804aa2ef667f14ff771e2cdece72367d340250265bf095a5d5  u-boot-2016.01.tar.bz2

 Don't we normally separate with tabs?

 Regards,
 Arnout

> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 6e4d0ed..3150279 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UBOOT_TOOLS_VERSION = 2015.10
> +UBOOT_TOOLS_VERSION = 2016.01
>  UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>  UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
>  UBOOT_TOOLS_LICENSE = GPLv2+
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
