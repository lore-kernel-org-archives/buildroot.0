From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 11:31:05 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/mpg123
In-Reply-To: <20090124101510.62459769CC@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 24 Jan 2009 10\:15\:09 +0000 \(UTC\)")
References: <20090124101510.62459769CC@busybox.osuosl.org>
Message-ID: <87r62tgfme.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-24 10:15:05 +0000 (Sat, 24 Jan 2009)
 ulf> New Revision: 24999

 ulf> Log:
 ulf> Add fix to mpg123 for bug in ARM release toolchain causing segment violation, bug reported to gcc bugzilla

So the toolchain patch you checked in didn't fix the issue? Should it
then be reverted?

-- 
Bye, Peter Korsgaard
