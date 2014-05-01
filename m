From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:39:35 +0200
Subject: [Buildroot] [PATCH v2] Makefile: target-purgelocales: fix
	top-level parallel make support
In-Reply-To: <1398785554-6797-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Tue, 29 Apr 2014 17:32:34 +0200")
References: <1398785554-6797-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87mwf1qiug.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The "target-purgelocales" target must be executed after all the other
 > targets and before the "target-finalize" target, so create a
 > TARGET_PURGE_LOCALES variable containing the commands of the target
 > "target-purgelocales" and add it at the beginning of the
 > "target-finalize" target.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > ---
 > v2:
 >   - rewrite the patch following Arnout suggestion

Committed, thanks.

-- 
Bye, Peter Korsgaard
