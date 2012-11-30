From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 14:01:56 -0800
Subject: [Buildroot] [PATCH] Makefile: fix thread libraries stripping
In-Reply-To: <1353431891-30930-1-git-send-email-rbraun@sceen.net> (Richard
 Braun's message of "Tue, 20 Nov 2012 18:18:11 +0100")
References: <1353431891-30930-1-git-send-email-rbraun@sceen.net>
Message-ID: <87624m92cr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Braun <rbraun@sceen.net> writes:

 Richard> Strip libthread_db the same as any other library, but strip libpthread
 Richard> with --strip-debug. See the relevant mailing list discussion [1] for
 Richard> additional details.

 Richard> [1] http://lists.busybox.net/pipermail/buildroot/2012-October/060126.html

Committed, thanks.

-- 
Bye, Peter Korsgaard
