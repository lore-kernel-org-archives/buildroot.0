From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:19:30 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20090125230123.541D376D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 23\:01\:23 +0000 \(UTC\)")
References: <20090125230123.541D376D28@busybox.osuosl.org>
Message-ID: <87y6wybnd9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 23:01:22 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25026

 ulf> Log:
 ulf> Flush configuration cache, needed if config has changed

It would be good if we could get the system to automatically detect
this instead of using a manual make target.

What is the use case for this? If someone changes the toolchain
config, or is it simply adding/removing packages?

-- 
Bye, Peter Korsgaard
