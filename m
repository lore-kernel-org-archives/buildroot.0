From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Dec 2015 11:58:26 +0200
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151201095826.GC2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, Dec 01, 2015 at 09:52:22AM +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove obsolete compilation error patch and update jimtcl related patch.

[...]

> -OPENOCD_VERSION = 0.8.0
> +OPENOCD_VERSION = 0.9.0
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> -OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
> +OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>  
>  OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

Is this still needed?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
