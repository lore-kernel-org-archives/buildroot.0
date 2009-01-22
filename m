From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 10:05:50 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libconfuse
In-Reply-To: <20090122071406.155456d9@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Thu\, 22 Jan 2009 07\:14\:06 +0100")
References: <20090121204512.4928A768C5@busybox.osuosl.org>
	<20090122071406.155456d9@hcegtvedt>
Message-ID: <878wp3pv69.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> libconfuse: fix build by removing -Werror flag
 >> 

 Hans-Christian> You know that is not fixing it ;) Source code should
 Hans-Christian> not generate warnings, they are usually a sign of
 Hans-Christian> something bad is happening.

 Hans-Christian> But I guess this is fine for now.

True, but in this case it's a simple warning about an unused variable.

Imho, shipping with -Werror isn't really a robust thing to do.

-- 
Bye, Peter Korsgaard
