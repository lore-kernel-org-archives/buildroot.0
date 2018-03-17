From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:36:08 +0100
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot versions
In-Reply-To: <20180317070629.15507-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 17 Mar 2018 08:06:29 +0100")
References: <20180317070629.15507-1-francois.perrad@gadz.org>
Message-ID: <87tvtfgkuf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  configs/olimex_a20_olinuxino_lime2_defconfig     | 4 ++--
 >  configs/olimex_a20_olinuxino_lime_defconfig      | 4 ++--
 >  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
 >  3 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
 > index 509b05029..64618c5e6 100644
 > --- a/configs/olimex_a20_olinuxino_lime2_defconfig
 > +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
 > @@ -18,7 +18,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 >  # Kernel
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.12"
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.26"

4.14.27 is out ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
