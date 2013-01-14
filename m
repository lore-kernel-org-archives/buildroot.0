From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 20:43:46 +0100
Subject: [Buildroot] [PATCH] linux-fusion: don't override CFLAGS/LDFLAGS
In-Reply-To: <1355159219-10867-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 10 Dec 2012 18:06:59 +0100")
References: <1355159219-10867-1-git-send-email-arnout@mind.be>
Message-ID: <87r4lnr1n1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Putting $(TARGET_CONFIGURE_OPTS) after $(MAKE) overrides the Makefile's
 Arnout> CFLAGS and LDFLAGS. Some of these flags are required, however. So
 Arnout> instead pass these things in the environment, which allows the Makefile
 Arnout> to append to the flags.

 Arnout> This removes the need for the patch, because now the correct -I options
 Arnout> are added.

Committed, thanks.

-- 
Bye, Peter Korsgaard
