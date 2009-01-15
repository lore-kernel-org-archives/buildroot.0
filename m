From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 09:58:44 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
In-Reply-To: <20090114234926.0B74B7697C@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Wed\, 14 Jan 2009 23\:49\:25 +0000 \(UTC\)")
References: <20090114234926.0B74B7697C@busybox.osuosl.org>
Message-ID: <873afl9c8r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-14 23:49:24 +0000 (Wed, 14 Jan 2009)
 ulf> New Revision: 24847

 ulf> Log:
 ulf> libeXosip2 is dependent on libosip2

 ulf> Modified:
 ulf>    trunk/buildroot/package/libeXosip2/libeXosip2.mk

You forgot a select in Config.in

Please fix.

-- 
Bye, Peter Korsgaard
