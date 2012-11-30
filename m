From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 13:58:24 -0800
Subject: [Buildroot] [PATCH] toolchain-external: fix installation of
	libthread_db
In-Reply-To: <1353428243-18866-1-git-send-email-rbraun@sceen.net> (Richard
 Braun's message of "Tue, 20 Nov 2012 17:17:23 +0100")
References: <1353428243-18866-1-git-send-email-rbraun@sceen.net>
Message-ID: <87a9ty92in.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Braun <rbraun@sceen.net> writes:

 Richard> Whatever the gdbserver source, as long as it's installed on
 Richard> the target, assume it requires libthread_db.

Committed, thanks.

-- 
Bye, Peter Korsgaard
