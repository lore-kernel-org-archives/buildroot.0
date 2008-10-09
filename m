From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Oct 2008 11:45:00 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <20081009050643.525103C755@busybox.net> (correa@uclibc.org's
	message of "Wed\, 8 Oct 2008 22\:06\:43 -0700 \(PDT\)")
References: <20081009050643.525103C755@busybox.net>
Message-ID: <87vdw2w19f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2008-10-08 22:06:42 -0700 (Wed, 08 Oct 2008)
 correa> New Revision: 23629

 correa> Log:
 correa> Fix dependencies in directfb config options

What about the dependencies in the Makefile to ensure those things are
built before directfb?

Will you also fix the white space issues in Config.in?

Thanks.

-- 
Bye, Peter Korsgaard
