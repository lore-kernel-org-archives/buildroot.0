From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:40:26 +0200
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.25
In-Reply-To: <20200914194659.177826-1-francois.perrad@gadz.org>
References: <20200914194659.177826-1-francois.perrad@gadz.org>
Message-ID: <20200919214026.3d34d890@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 21:46:59 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> patch merged
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...Makefile-am-install-mc-lib-only-once.patch | 60 -------------------
>  package/mc/mc.hash                            |  4 +-
>  package/mc/mc.mk                              |  2 +-
>  3 files changed, 3 insertions(+), 63 deletions(-)
>  delete mode 100644 package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch

Due to the patch being dropped, AUTORECONF = YES was no longer needed,
so I dropped it as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
