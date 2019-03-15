From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:20:04 +0100
Subject: [Buildroot] [PATCH 1/3]
 olimex_a20_olinuxino_lime_legacy_defconfig: remove it
In-Reply-To: <20190306152426.8402-2-francois.perrad@gadz.org>
References: <20190306152426.8402-1-francois.perrad@gadz.org>
 <20190306152426.8402-2-francois.perrad@gadz.org>
Message-ID: <20190315232004.1cc38536@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed,  6 Mar 2019 16:24:24 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> The old 3.4 Linux kernel used by this defconfig doesn't build with gcc 7.x
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino/boot-legacy.cmd    |  5 --
>  board/olimex/a20_olinuxino/post-build.sh      |  5 --
>  board/olimex/a20_olinuxino/readme.txt         |  7 ---
>  ...olimex_a20_olinuxino_lime_legacy_defconfig | 56 -------------------
>  4 files changed, 73 deletions(-)
>  delete mode 100644 board/olimex/a20_olinuxino/boot-legacy.cmd
>  delete mode 100644 configs/olimex_a20_olinuxino_lime_legacy_defconfig

Thanks, I've applied the series, after improving a bit the text in
Config.in.legacy.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
