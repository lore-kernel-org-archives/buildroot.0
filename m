From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 11:58:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/htop: add debian patch for
 fixing build with gcc 10
In-Reply-To: <20200807084734.1528758-1-fido_max@inbox.ru>
References: <20200807084734.1528758-1-fido_max@inbox.ru>
Message-ID: <20200807115808.50affa62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

Thanks for your contribution!

On Fri,  7 Aug 2020 11:47:34 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> +HTOP_PATCH = \
> +	https://sources.debian.org/data/main/h/htop/2.2.0-3/debian/patches/gcc10.patch

These Debian URLs are unfortunately not stable, so I think we generally
prefer to bring the patch in Buildroot itself.

However, isn't the patch
https://github.com/hishamhm/htop/pull/1017/commits/dfd9279f87791e36a5212726781c31fbe7110361
a bit more complete ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
