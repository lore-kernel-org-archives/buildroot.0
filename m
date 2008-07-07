From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 15:21:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080704222950.E76B63C61F@busybox.net> (ulf@uclibc.org's message
	of "Fri\, 4 Jul 2008 15\:29\:50 -0700 \(PDT\)")
References: <20080704222950.E76B63C61F@busybox.net>
Message-ID: <873aml7ru0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-04 15:29:50 -0700 (Fri, 04 Jul 2008)
 ulf> New Revision: 22640

 ulf> Log:
 ulf> Add 'build with log'

Do we need this in buildroot? What's the advantage of doing this in
buildroot instead of in an external wrapper?

As mentioned earlier, it doesn't work with Makefile.autotools.in using
packages.

-- 
Bye, Peter Korsgaard
