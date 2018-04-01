From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:45:53 +0200
Subject: [Buildroot] [PATCH v2,1/1] mpd: add support for libupnp18
In-Reply-To: <20180311093358.20853-1-fontaine.fabrice@gmail.com>
References: <20180311093358.20853-1-fontaine.fabrice@gmail.com>
Message-ID: <20180402004553.36115152@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Mar 2018 10:33:58 +0100, Fabrice Fontaine wrote:
> Instead of selecting BR2_PACKAGE_LIBUPNP, select BR2_PACKAGE_LIBUPNP18
> if BR2_PACKAGE_LIBUPNP is not enabled
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1->v2 (after review of Baruch Siach and Yann E. Morin):
>  - select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP instead of using
>  depends on BR2_PACKAGE_LIBUPNP || BR2_PACKAGE_LIBUPNP18

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
