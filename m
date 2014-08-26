From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2014 23:49:27 +0200
Subject: [Buildroot] [PATCH] libev: don't install event.h
In-Reply-To: <1409052977-12935-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 26 Aug 2014 08:36:17 -0300")
References: <1409052977-12935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ha0yvs48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's a 'compatibility layer' with libevent which we:
 > 1) Don't need
 > 2) Possibly outdated with respect to libevent2
 > 3) Causes build failures

 > Fixes:
 > http://autobuild.buildroot.net/results/451/4510fe02ef3497803ed27bf339dca07b3b073c10/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
