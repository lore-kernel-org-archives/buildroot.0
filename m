From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Aug 2008 14:55:20 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
In-Reply-To: <20080828115217.4ECAB3C83A@busybox.net> (laird@uclibc.org's
	message of "Thu\, 28 Aug 2008 04\:52\:17 -0700 \(PDT\)")
References: <20080828115217.4ECAB3C83A@busybox.net>
Message-ID: <87ljyhqoxz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-08-28 04:52:17 -0700 (Thu, 28 Aug 2008)
 laird> New Revision: 23275

 laird> Log:
 laird> libxslt: Convert to Makefile.autotools.in format

 laird> Converted to Makefile.autotools.in format
 laird> Version bumped to 1.1.24
 laird> Enabled crypto support dependant on gcrypt being chosen/not
 laird> Post process xslt-config file like freetype-config/xm2-config.

I would still prefer you to these things in bite sized commits,
E.G. one patch to convert to Makefile.autotools.in, one to bump the
version, 1 to add crypto support and so on.

Makes it a lot easier to review and/or revert mistakes.

-- 
Bye, Peter Korsgaard
