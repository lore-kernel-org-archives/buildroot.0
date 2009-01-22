From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 10:08:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
In-Reply-To: <20090122075324.D71DA765E9@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Thu\, 22 Jan 2009 07\:53\:24 +0000 \(UTC\)")
References: <20090122075324.D71DA765E9@busybox.osuosl.org>
Message-ID: <874ozrpv1k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-22 07:53:24 +0000 (Thu, 22 Jan 2009)
 ulf> New Revision: 24952

 ulf> Log:
 ulf> Add simple way to enable most (but not all) targets for testing purposes

Please don't do that. That's not a common use case. If you want to
test everything, just use make allyesconfig instead.

Having such an explicit list hidden away under target/generic is bound
to get out of sync with packages/ in no time.

-- 
Bye, Peter Korsgaard
