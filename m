From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:06:29 +0200
Subject: [Buildroot] [PATCH 1/2] board: rename ts to technologic
In-Reply-To: <1461255673-11443-2-git-send-email-damien.riegel@savoirfairelinux.com>
References: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1461255673-11443-2-git-send-email-damien.riegel@savoirfairelinux.com>
Message-ID: <20160421230629.45dc0009@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 12:21:12 -0400, Damien Riegel wrote:
> Other projects, such as Linux [1] and U-Boot [2], use "technologic" for
> this manufacturer. To be more consistent across all of them, rename the
> board/ts folder to board/technologic.
> 
> [1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/vendor-prefixes.txt
> [2] http://git.denx.de/?p=u-boot.git;a=tree;f=board/technologic;hb=HEAD
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  .../{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg  | 0
>  board/{ts => technologic}/ts5x00/linux-3.17.config                    | 0
>  board/{ts => technologic}/ts5x00/readme.txt                           | 0
>  configs/ts5x00_defconfig                                              | 4 ++--
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename board/{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg (100%)
>  rename board/{ts => technologic}/ts5x00/linux-3.17.config (100%)
>  rename board/{ts => technologic}/ts5x00/readme.txt (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
