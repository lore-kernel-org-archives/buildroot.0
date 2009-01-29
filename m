From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 17:16:44 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <1233245463.15375.41.camel@sven> (Sven Neumann's message of "Thu\,
	29 Jan 2009 17\:11\:03 +0100")
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk> <1233245463.15375.41.camel@sven>
Message-ID: <871vumrssz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

Hi,

 >> default apcs-gnu        if BR2_ARM_OABI
 >> default atpcs           if BR2_arm_dunno
 >> default aapcs           if BR2_arm_dunno
 >> default aapcs-linux     if BR2_ARM_EABI

 Sven> As you can see from the linked thread, the compiler we ended up
 Sven> with works nicely for userspace, but it cannot be used to build
 Sven> a kernel. It may be a good idea to set BR2_GCC_TARGET_ABI to
 Sven> aapcs-linux even if BR2_iwmmxt is selected.

Ok, thanks.

 >> Could you give it a try with those 2 lines changed?

 Sven> What exactly do you want me to try? I guess I would have to
 Sven> remove my .config and go thru menuconfig, select ARM iwmmxt and
 Sven> then check what gets sets for BR2_GCC_TARGET_TUNE,
 Sven> BR2_GCC_TARGET_ARCH and BR2_GCC_TARGET_ABI? Is that correct?

I meant with the apcs-gnu for OABI, and aapcs-linux for EABI, wasn't
that your original problem?

-- 
Bye, Peter Korsgaard
