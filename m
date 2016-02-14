From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2016 20:29:34 +0100
Subject: [Buildroot] [PATCH 3/3] configs/firefly_rk3288: new board
In-Reply-To: <56C0CEF5.8000806@vanguardiasur.com.ar> (Ariel D'Alessandro's
 message of "Sun, 14 Feb 2016 16:01:09 -0300")
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1453478020-311-4-git-send-email-ariel@vanguardiasur.com.ar>
 <87ziv8qnnk.fsf@dell.be.48ers.dk>
 <56C0CEF5.8000806@vanguardiasur.com.ar>
Message-ID: <87povznl9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ariel" == Ariel D'Alessandro <ariel@vanguardiasur.com.ar> writes:

Hi,

>> Our defconfigs are normally very minimal, E.G. only a basic busybox
 >> based image and a kernel/bootloader - In other words the basics to start
 >> your own development from.
 >> 
 >> There has been some discussion about doing more full blown "demo"
 >> defconfigs, so I'm fine with adding a more complicated
 >> firefly_rk3288_demo_defconfig in addition to the basic one.

 > I see. So, I could submit a firefly_rk3288_demo_defconfig with Qt5
 > enabled and a firefly_rk3288_defconfig without it, just the minimal
 > stuff. Do you agree?

Yes, that's fine!

 >>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/pre-image.sh"
 >> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
 >> > +BR2_LINUX_KERNEL=y
 >> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
 >> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
 >> 
 >> Will this commit stay available or is this a branch that gets rebased?

 > It's a devel branch from Heiko, so it will rebased almost for sure.
 > However, this commit is probably to stay available as it isn't one of
 > the latest ones.

 > Of course, the right thing to do here is to take the kernel from
 > mainline and patch it with the Midgard stuff. I'm planning doing this in
 > the future, but just for now I think that building from that Heiko's
 > commit won't cause any trouble.

Ok. It would be good to hear from Heiko if we can expect this commit to
stay. Heiko, what do you say?

 >> Other than that it looks good, thanks. Care to send updated patches
 >> fixing these issues?
 >> 

 > Yeah, I'm sending a patchset v2 ASAP. Thanks!

Great, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
