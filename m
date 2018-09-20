From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:09:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/strongswan: install dev headers
In-Reply-To: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920210911.47c51755@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 10:16:27 -0500, Matt Weber wrote:
> Adds '--with-dev-headers' configure option to install
> development headers into staging.  The package provides
> these headers to enable linking against pluggins.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/strongswan/strongswan.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 5c597d5..f2e70a3 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -10,6 +10,7 @@ STRONGSWAN_SITE = http://download.strongswan.org
>  STRONGSWAN_LICENSE = GPL-2.0+
>  STRONGSWAN_LICENSE_FILES = COPYING LICENSE
>  STRONGSWAN_DEPENDENCIES = host-pkgconf
> +STRONGSWAN_INSTALL_STAGING=YES

Spaces around the = sign. I've fixed this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
