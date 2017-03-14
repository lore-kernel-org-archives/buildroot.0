From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 08:40:07 +0100
Subject: [Buildroot] [PATCH 2/2] olimex_a20_olinuxino_lime: bump versions
In-Reply-To: <1489475994-28540-2-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Tue, 14 Mar 2017 08:19:54 +0100")
References: <1489475994-28540-1-git-send-email-francois.perrad@gadz.org>
 <1489475994-28540-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <8760jcux0o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  configs/olimex_a20_olinuxino_lime_defconfig      | 4 ++--
 >  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
 > index 10ce44d..c92b016 100644
 > --- a/configs/olimex_a20_olinuxino_lime_defconfig
 > +++ b/configs/olimex_a20_olinuxino_lime_defconfig
 > @@ -18,7 +18,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/b
 >  # Kernel
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.2"
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.14"

Committed, thanks. Any specific reason to not use 4.10.x?

-- 
Bye, Peter Korsgaard
