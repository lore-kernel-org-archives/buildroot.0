From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 25 May 2015 16:38:10 +0200
Subject: [Buildroot] Help for another newbie,
 AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi
In-Reply-To: <B03A893ADFE80748942D13AFAF28451924E703A8C9@ITSVLEX06.it.maxim-ic.internal>
References: <1432452387471-101939.post@n4.nabble.com>
 <20150524130250.36ebd47d@free-electrons.com>
 <B03A893ADFE80748942D13AFAF28451924E703A8C9@ITSVLEX06.it.maxim-ic.internal>
Message-ID: <20150525143810.GB3199@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 24/05/2015 at 19:06:36 -0700, Ted Salazar wrote :
> 
> [TS: Yes I was aware of Alexandre's patches but several things were not clear enough to me to be able to use it. Sorry this is basic to you but not to me.
> 
> 1.       Who  runs the at91.com/Linux4Sam website? I thought this was an Atmel run website? If so and you only support mainline BuildRoot then why does Alexandre's sam9x5ek patches contain Linux4sam URLs (ie URL=https://github.com/linux4sam/linux-at91.git and URL="git://github.com/linux4sam/u-boot-at91.git" ) shown here http://patchwork.ozlabs.org/patch/473928/
> 

Atmel is. I'm using their version of the kernel, u-boot and
at91bootstrap because they are maintaining stble versions of each.

> 3.       Does Alexandre's patch create all of the required at91sam9x5 defconfig files needed in order to build the AT91Bootstrap, uboot, Kernel and .ubifs filesystem too?
> 

Yes.

> 4.       OK, if Alexandre's patch does not work on Atmel's forked BuildRoot then I will try using mainline BuildRoot. In fact, I'll probably try both BuildRoot versions no matter what. I'll read the manual at http://buildroot.uclibc.org/downloads/manual/manual.html
> 

It will also work on buildroot-at91 but this doesn't make any sense to try that. As it is older and is actually outdated.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
