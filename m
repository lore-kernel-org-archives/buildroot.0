From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Sep 2012 21:34:28 +0200
Subject: [Buildroot] [PATCHv2] libfuse: fix build failures with iconv
In-Reply-To: <1347019158-30268-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 08:59:18 -0300")
References: <1347019158-30268-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txv939vf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix build failures when iconv is present for libfuse users that use
 Gustavo> pkgconfig.
 Gustavo> For example:
 Gustavo> http://autobuild.buildroot.net/results/4d455831a7b467b9ea1ad54bea6b57607f5560a8/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
