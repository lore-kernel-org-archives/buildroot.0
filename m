From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Jan 2014 23:23:27 +0100
Subject: [Buildroot] [PATCH] strace: Fix build issue with duplicate
	ptrace_peeksiginfo_args definition
In-Reply-To: <20131202173337.730038ed@kryten> (Anton Blanchard's message of
 "Mon, 2 Dec 2013 17:33:37 +1100")
References: <20131202173337.730038ed@kryten>
Message-ID: <87lhyqm7ts.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Blanchard <anton@samba.org> writes:

 > Backport a patch from upstream to fix a conflict between glibc
 > headers and recent kernel headers (v3.10 or newer).
    
 > Signed-off-by: Anton Blanchard <anton@samba.org>
 > ---

 > Since it would not autoreconf cleanly, I included a separate patch that
 > made the configure changes. Not sure if the preference is to roll that
 > into an upstream patch, or to provide it separately.

Committed, thanks.

-- 
Bye, Peter Korsgaard
