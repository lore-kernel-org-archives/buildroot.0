From: Martin Bark <martin@barkynet.com>
Date: Wed, 26 Mar 2014 09:05:08 +0000
Subject: [Buildroot] [PATCH] package/ca-certificates: security bump to
	20140223
In-Reply-To: <1395770212-21932-1-git-send-email-yann.morin.1998@free.fr>
References: <1395770212-21932-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <53329844.5010601@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 25/03/14 17:56, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Some new CA added, some removed.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Martin Bark <martin@barkynet.com>
> ---
>   package/ca-certificates/ca-certificates.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index c975a7d..f7c27bd 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>
> -CA_CERTIFICATES_VERSION = 20130906
> -CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
> -CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20130907T154615Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_VERSION = 20140223
> +CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> +CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20140325T163435Z/pool/main/c/ca-certificates/
>   CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
>   CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
>   CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>

Looks good to me. I guess this means this patch 
http://patchwork.ozlabs.org/patch/328808 will need an update too.

Thanks

Martin
