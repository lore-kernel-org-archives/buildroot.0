From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 4 Mar 2011 22:06:41 +0000
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F734F29@EXV1.corp.adtran.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F734F29@EXV1.corp.adtran.com>
Message-ID: <AANLkTikLN+Pr2+Stg_mb2fDvEZrRtHO9A_W14Xjd_=o3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy

I'm attempting to do a full build (uImage and rootfs)

I've got 6 kernel patches which I need to apply before running the "full
build", they add "board support" for my module and various other "nand"
related bits. One of the patches adds
"arch/arm/configs/telit_ge863_defconfig"









On Fri, Mar 4, 2011 at 9:52 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com>wrote:

> > if I patch "/opt/buildroot/output/toolchain/linux-2.6.38-rc5"
>
> that is the Linux-headers directory.  The _kernel_ gets compiled
> under buildroot/output/build/linux-$(LINUX_VERSION).
>
> So, are you having problems building the kernel-headers or the
> kernel?
>
> Andy
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110304/190bdb25/attachment.html>
