From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Jan 2015 16:06:38 +0200
Subject: [Buildroot] [PATCH] package/nettle: bump version
In-Reply-To: <1421589567-19731-1-git-send-email-yann.morin.1998@free.fr>
References: <1421589567-19731-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150118140638.GI2555@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jan 18, 2015 at 02:59:27PM +0100, Yann E. MORIN wrote:
> The patch we had to fix shared-only builds is no longer needed.
> The licensing has changed to a mix of GPLv2+, GPLv3+ and LGPLv3+.

You mention GPLv2+ here ...

> -NETTLE_LICENSE = LGPLv2.1+
> -NETTLE_LICENSE_FILES = COPYING.LIB
> +NETTLE_LICENSE = GPLv3+, LGPLv3+

... but here GPLv2+ is missing.

> +NETTLE_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
