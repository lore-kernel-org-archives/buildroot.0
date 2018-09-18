From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:01:18 +0200
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_legacy: mali
 renamed legacy
In-Reply-To: <20180918163523.11169-1-francois.perrad@gadz.org>
References: <20180918163523.11169-1-francois.perrad@gadz.org>
Message-ID: <20180918210118.10f3eeca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 18:35:23 +0200, Francois Perrad wrote:
> as mali is now also available with the kernel mainline
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .gitlab-ci.yml                                                | 2 +-
>  board/olimex/a20_olinuxino/{boot-mali.cmd => boot-legacy.cmd} | 0
>  board/olimex/a20_olinuxino/readme.txt                         | 4 ++--
>  ...i_defconfig => olimex_a20_olinuxino_lime_legacy_defconfig} | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename board/olimex/a20_olinuxino/{boot-mali.cmd => boot-legacy.cmd} (100%)
>  rename configs/{olimex_a20_olinuxino_lime_mali_defconfig => olimex_a20_olinuxino_lime_legacy_defconfig} (99%)

Applied to master after improving the commit title/commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
