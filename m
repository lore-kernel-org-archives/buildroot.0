From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Apr 2010 11:01:52 +0200
Subject: [Buildroot] [PATCH] tslib: fix use of open()
In-Reply-To: <1272011093-4995-1-git-send-email-luca@lucaceresoli.net>
	(luca@lucaceresoli.net's message of "Fri, 23 Apr 2010 10:24:53 +0200")
References: <1272011093-4995-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87tyr25ypr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "luca" == luca  <luca@lucaceresoli.net> writes:

 luca> From: Luca Ceresoli <luca@lucaceresoli.net>
 luca> Fixes error: "open with O_CREAT in second argument needs 3 arguments".

 luca> Original patch: svn://svn.berlios.de/tslib/trunk/tslib r72.

Thanks, committed - I grabbed the original patch for commit message /
attribution though.

-- 
Bye, Peter Korsgaard
