From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Dec 2012 18:35:21 +0200
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com>
References: <CAOPBCFULJTm7iooZ8=nnpMoooaRq=1PK11hhYyyGVr=DdM2e2w@mail.gmail.com>
 <20121226070612.GC7402@sapphire.tkos.co.il>
 <20121226094937.3c2b9383@skate>
 <CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com>
Message-ID: <20121226163521.GL11946@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Wed, Dec 26, 2012 at 09:55:47AM +0100, Marcin Bis wrote:
[...]
> +USBIP_VERSION = 0.1.7

This package is very old. Newer version is distributed with the kernel sources 
under drivers/staging/usbip/userspace/. I'm not sure how to extract these 
files during build. Maybe the experts here have an Idea?

baruch

> +USBIP_SITE = http://downloads.sourceforge.net/project/usbip/usbip/$(USBIP_VERSION)
> +USBIP_LICENSE = GPLv2+
> +USBIP_LICENSE_FILES = COPYING
> +USBIP_CONF_OPT = --without-tcpwrappers
> +USBIP_DEPENDENCIES = libglib2 libsysfs

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
