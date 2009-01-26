From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 17:27:44 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090125214834.783FA76D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 21\:48\:34 +0000 \(UTC\)")
References: <20090125214834.783FA76D28@busybox.osuosl.org>
Message-ID: <877i4i6ni7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 21:48:33 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25024

 ulf> Log:

 ulf> Use new SHELL variable BUILDROOT_KERNEL_CONFIG_METHOD
 ulf> which will override selection between xconfig and menuconfig

Let's not add any more undocumented command line options for such
special cases like this.

-- 
Bye, Peter Korsgaard
