From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Nov 2013 18:06:26 +0100
Subject: [Buildroot] [PATCH] dropwatch: adjust LDFLAGS
In-Reply-To: <1385553979-25760-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 27 Nov 2013 09:06:19 -0300")
References: <1385553979-25760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761rd3hbh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add more library links into LDFLAGS.
 > -lncurses because readline uses it (missing _tputs and others).
 > -lpthread for missing _pthread_rwlock_unlock and others.
 > -lm for missing _rint.
 > Fixes:
 > http://autobuild.buildroot.net/results/6b1/6b1f4f2167d8aca0d73dc0e66fd2e1704c821c61/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
