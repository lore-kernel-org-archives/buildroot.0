From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 23:24:59 +0200
Subject: [Buildroot] Filesystem being corrupted
In-Reply-To: <53B66E3C.6090004@the-playground.dk> (Robert Larsen's message of
 "Fri, 04 Jul 2014 11:05:00 +0200")
References: <53B5331B.9030703@the-playground.dk>
 <53B54CEC.5070803@zacarias.com.ar>
 <53B55511.8030706@the-playground.dk>
 <53B567C2.2070502@the-playground.dk>
 <20140703202242.223b38ab@free-electrons.com>
 <53B66E3C.6090004@the-playground.dk>
Message-ID: <87r4204y1g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Larsen <robert@the-playground.dk> writes:

 > On 07/03/2014 08:22 PM, Thomas Petazzoni wrote:
 >> You should start with the qemu_arm_versatile_defconfig available in
 >> Buildroot, which uses a correct kernel configuration.
 > That was the one I used, and I didn't change a thing in the kernel
 > config :-(

 > The only thing changed between my vexpress and new build is this:

 > 322c322
 > < BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 > ---
 >> BR2_LINUX_KERNEL_DEFCONFIG="versatile"

But are you using the qemu_arm_versatile *BUILDROOT* defconfig? That one
E.G. uses a custom Linux defconfig
(board/qemu/arm-versatile/linux-3.13.config)

-- 
Bye, Peter Korsgaard
