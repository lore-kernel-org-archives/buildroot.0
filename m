From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Oct 2015 09:57:56 +0100
Subject: [Buildroot] [PATCH 1/1] wandboard_defconfig: bump u-boot to
 2015.07 and kernel to 3.14.28_1.0.0
In-Reply-To: <1443886802-23226-1-git-send-email-sergio.prado@e-labworks.com>
References: <1443886802-23226-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151006095756.29e0d0ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Sat,  3 Oct 2015 12:40:02 -0300, Sergio Prado wrote:
> Bump U-boot version to 2015.07 from the mainline repository. Since there
> is SPL support for the wandboard in the U-boot 2015.07, it is now
> possible to boot the same U-boot image for all wandboard variants
> (solo/dual/quad).
> 
> Bump kernel version to 3.14.28_1.0.0 from the wandboard git repository.
> 
> Tested on Wandboard Solo, Wandboard Dual and Wandboard Quad.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  board/wandboard/genimage.cfg  | 10 ++++++++--
>  board/wandboard/uboot-env.txt | 22 +++++++++++++++-------
>  configs/wandboard_defconfig   | 24 +++++++++++++++---------
>  3 files changed, 38 insertions(+), 18 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
