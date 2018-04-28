From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:12:55 +0200
Subject: [Buildroot] [PATCH 1/1] abootimg: new package
In-Reply-To: <1522846449-22363-1-git-send-email-julien.boibessot@free.fr>
References: <1522846449-22363-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20180428151255.70f316a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 14:54:09 +0200, julien.boibessot at free.fr wrote:

> +ABOOTIMG_VERSION = 7e127fee6a3981f6b0a50ce9910267cd501e09d4
> +ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
> +ABOOTIMG_LICENSE = GPLv2

The proper encoding for this license is GPL-2.0, and in fact the
license is GPLv2 or later, so the correct value here was GPL-2.0+.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
