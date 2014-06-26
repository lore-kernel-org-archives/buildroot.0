From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jun 2014 14:43:03 +0200
Subject: [Buildroot] [PATCH] whois: add extra libs for libiconv
In-Reply-To: <1403777131-3592-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 07:05:31 -0300")
References: <1403777131-3592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738errgdk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The main makefile doesn't check/do anything about linking properly, so
 > add -liconv to LIBS when it's used. Fixes:
 > http://autobuild.buildroot.net/results/7e5/7e551efacfa16b9e1915748a2f66fd1021d5bb49/

Committed, thanks.

-- 
Bye, Peter Korsgaard
