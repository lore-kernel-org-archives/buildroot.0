From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Jan 2013 00:20:25 +0100
Subject: [Buildroot] [PATCH 1] xtensa: sqlite requires special compiler
	option
In-Reply-To: <50fef791.c587440a.325a.2b65@mx.google.com> (Chris Zankel's
 message of "Tue, 22 Jan 2013 12:33:19 -0800")
References: <50fef791.c587440a.325a.2b65@mx.google.com>
Message-ID: <874nhza85i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 Chris> Some of the generated object files are too large for PC-relative addressing,
 Chris> so use the --test-section-literals to move symbols closer to the code.

The option seems to be -mtext-section-literals.

Committed with the commit message corrected, thanks.

-- 
Bye, Peter Korsgaard
