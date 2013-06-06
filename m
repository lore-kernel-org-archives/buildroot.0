From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jun 2013 16:50:08 +0200
Subject: [Buildroot] [PATCH] p11-kit: fix __progname build failure
In-Reply-To: <1370529738-5275-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 6 Jun 2013 11:42:18 -0300")
References: <1370529738-5275-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txlb9tun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Even though we've got UCLIBC_HAS___PROGNAME=y in our internal toolchains
 Gustavo> the build seems to fail under some circumstances.
 Gustavo> Since program_invocation_short_name is equally as useful just disable
 Gustavo> __progname usage. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/cc8/cc861f5a034a0922a90fb6f22835a1fe8205d497/

Committed, thanks.

-- 
Bye, Peter Korsgaard
