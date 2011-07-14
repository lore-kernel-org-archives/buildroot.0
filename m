From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jul 2011 16:46:49 +0200
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
	versions
In-Reply-To: <1310653763.10990.1.camel@sven> (Sven Neumann's message of "Thu, 
 14 Jul 2011 16:29:23 +0200")
References: <20110711214654.9E4738A482@busybox.osuosl.org>
 <1310632596.2068.3.camel@sven> <87ipr5cg14.fsf@macbook.be.48ers.dk>
 <1310653763.10990.1.camel@sven>
Message-ID: <87y600c42u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> On Thu, 2011-07-14 at 12:28 +0200, Peter Korsgaard wrote:
 >> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
 >> 
 >> Hi,
 >> 
 Sven> I've updated to latest git today and ran into this error:
 >> 
 Sven> linux/linux.mk:26: *** Recursive variable `LINUX_SITE' references itself
 Sven> (eventually).  Stop.
 >> 
 >> Interesting, I haven't seen that here. What make version are you using?

 Sven> GNU Make 3.81

 >> I just built qemu_arm_versatile_defconfig with make 3.81 without any
 >> problems. Could you post your config, please?

 Sven> Here's the kernel part, in the hope that this is sufficient:

Ahh yes, fixed - Thanks.

-- 
Bye, Peter Korsgaard
