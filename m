From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Feb 2013 07:14:09 +0200
Subject: [Buildroot] [PATCH] new package: libtasn1
In-Reply-To: <1361118230-9138-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361118230-9138-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130218051408.GA20428@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Sun, Feb 17, 2013 at 06:23:50PM +0200, Stefan Fr?berg wrote:

[...]

> +LIBTASN1_VERSION = 3.2
> +LIBTASN1_SOURCE = libtasn1-$(LIBTASN1_VERSION).tar.gz

You can drop this line. This is the default.

> +LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
> +LIBTASN1_DEPENDENCIES = host-bison host-microperl
> +LIBTASN1_LICENSE = GPLv3 LGPLv2.1
> +LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
> +LIBTASN1_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
