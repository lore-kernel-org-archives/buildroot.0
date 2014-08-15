From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:29:58 +0200
Subject: [Buildroot] [PATCH] package/infozip: Rename HOST_CC to HOSTCC
In-Reply-To: <1408141375-3893-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sat, 16 Aug 2014 00:22:55 +0200")
References: <1408141375-3893-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87ha1d1j4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Wrong variable name is used which can lead to build errors for the host variant:
 > [...] -I. -DUNIX" AS=" -c" -f unix/Makefile generic

 > c _match.s
 > make[1]: c: command not found

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
