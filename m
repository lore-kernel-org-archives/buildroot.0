From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 17:20:13 +0100
Subject: [Buildroot] [PATCH] mpd: add patch to fix build failures
In-Reply-To: <1422279958-1335-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 26 Jan 2015 10:45:58 -0300")
References: <1422279958-1335-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhkp1pky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > mpd is using snprintf without including stdio.h when pthread_setname_np
 > isn't available leading to failure, hence patch it. Fixes:
 > http://autobuild.buildroot.net/results/14c/14cf165e63fd7bb076d7c8f5aab92d24aa4622c4/

 > Patch status: sent upstream.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
