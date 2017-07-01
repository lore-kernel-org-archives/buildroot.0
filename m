From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:38:17 +0200
Subject: [Buildroot] [PATCH 1/2] olimex_a20: refactor with U-Boot boot
 script
In-Reply-To: <20170701193704.12792-1-francois.perrad@gadz.org>
References: <20170701193704.12792-1-francois.perrad@gadz.org>
Message-ID: <20170702003817.10e9f7da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 21:37:03 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino/post-build.sh         | 10 +++-------
>  configs/olimex_a20_olinuxino_lime2_defconfig     |  3 ++-
>  configs/olimex_a20_olinuxino_lime_defconfig      |  3 ++-
>  configs/olimex_a20_olinuxino_lime_mali_defconfig |  3 ++-
>  configs/olimex_a20_olinuxino_micro_defconfig     |  3 ++-
>  5 files changed, 11 insertions(+), 11 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
