From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:02:13 +0100
Subject: [Buildroot] [PATCH 1/2] fs/initramfs: fix initramfs support
In-Reply-To: <1394139335-28476-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394139335-28476-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140306230213.03554abd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  6 Mar 2014 17:55:34 -0300, Gustavo Zacarias wrote:
> On commit a24877586a566e052897e50e6a0c2f53cfb029f TARGETS_ROOTFS was
> introduced, however fs/initramfs/initramfs.mk was never updated, hence a
> show-targets would be rootfs-initramfs with rootfs-cpio afterwards hence
> never rebuilding the kernel with a proper cpio archive since TARGETS is
> always before rootfs-* as stated in the commit description.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  fs/initramfs/initramfs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
