From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 08:59:30 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-lib
In-Reply-To: <20090112074014.90A93766E4@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 12 Jan 2009 07\:40\:13 +0000 \(UTC\)")
References: <20090112074014.90A93766E4@busybox.osuosl.org>
Message-ID: <877i51j6ot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-12 07:40:08 +0000 (Mon, 12 Jan 2009)
 ulf> New Revision: 24780

 ulf> Log:
 ulf> Disable use of python in alsa-lib, if not configured

How about converting it into Makefile.autotools.in format while you're
at it?

-- 
Bye, Peter Korsgaard
