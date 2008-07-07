From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 15:27:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20080704221857.6ED043C61F@busybox.net> (ulf@uclibc.org's message
	of "Fri\, 4 Jul 2008 15\:18\:57 -0700 \(PDT\)")
References: <20080704221857.6ED043C61F@busybox.net>
Message-ID: <8763rh6czf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-04 15:18:56 -0700 (Fri, 04 Jul 2008)
 ulf> New Revision: 22638

 ulf> Log:
 ulf> Bump U-Boot version to 1.3.3

That breaks mkimage (BR2_TARGET_UBOOT_TOOL_MKIMAGE).

-- 
Bye, Peter Korsgaard
