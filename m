From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 21:30:27 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090126201708.B4FD677458@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 20\:17\:08 +0000 \(UTC\)")
References: <20090126201708.B4FD677458@busybox.osuosl.org>
Message-ID: <871vup6c9o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 20:17:06 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25065

 ulf> Log:
 ulf> Replace BUILDROOT_KERNEL_CONFIG_METHOD environment variable with BUILDROOT_USE_XWINDOWS

Why are you doing this after I explicitly said:

Let's not add any more undocumented command line options for such
special cases like this.

Renaming doesn't make it any better.

-- 
Bye, Peter Korsgaard
