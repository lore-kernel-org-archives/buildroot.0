From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 11:30:24 -0800
Subject: [Buildroot] [PATCH] make legal-info: fails with OVERRIDE_SRCDIR
In-Reply-To: <1354529151-17426-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Mon, 3 Dec 2012 11:05:51 +0100")
References: <1354529151-17426-1-git-send-email-sho@relinux.de>
Message-ID: <87y5hc8ffz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> There is a check for OVERRIDE_SRCDIR in pkg-generic.mk that is
 Stephan> supposed to produce a warning when OVERRIDE_SRCDIR is active.
 Stephan> This does not work and instead the whole make terminates with
 Stephan> an error message.

 Stephan> This patch changes the check for active OVERRIDE_SRCDIR so that
 Stephan> it works as expected.

Committed, thanks.

-- 
Bye, Peter Korsgaard
