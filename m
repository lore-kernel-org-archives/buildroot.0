From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:07:32 +0200
Subject: [Buildroot] [PATCH] ccid: bump to version 1.4.12
In-Reply-To: <1381284174.27485.9.camel@phoenix>
References: <1381284174.27485.9.camel@phoenix>
Message-ID: <52557F44.9070005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 04:02, Axel Lin wrote:
> Bump version and also add license information.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   package/ccid/ccid.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
> index a246ddd..c25b433 100644
> --- a/package/ccid/ccid.mk
> +++ b/package/ccid/ccid.mk
> @@ -4,9 +4,11 @@
>   #
>   ################################################################################
>
> -CCID_VERSION = 1.4.8
> +CCID_VERSION = 1.4.12
>   CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
> -CCID_SITE = http://alioth.debian.org/frs/download.php/file/3768
> +CCID_SITE = http://alioth.debian.org/frs/download.php/file/3937
> +CCID_LICENSE = LGPLv2.1+
> +CCID_LICENSE_FILES = COPYING

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(for the license only)

>   CCID_INSTALL_STAGING = YES
>   CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
