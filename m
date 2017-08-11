From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 22:38:15 +0200
Subject: [Buildroot] [PATCH 1/1] board/beaglebone: skip bonegreen.dtb if
 not built
In-Reply-To: <1502478183-27863-1-git-send-email-lothar.felten@gmail.com>
References: <1502478183-27863-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20170811223815.399f1f85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Aug 2017 21:03:03 +0200, Lothar Felten wrote:
> The beaglebone_qt5_defconfig uses an older kernel version which does not
> provide a device tree for the beagle bone green.
> post-image.sh now selects genimage_linux41.cfg if am335x-bonegreen.dtb is
> not build and genimage.cfg otherwise.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  board/beaglebone/genimage_linux41.cfg | 32 ++++++++++++++++++++++++++++++++
>  board/beaglebone/post-image.sh        | 10 +++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 board/beaglebone/genimage_linux41.cfg

Applied to master with some minor tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
