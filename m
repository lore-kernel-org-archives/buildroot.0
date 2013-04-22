From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Apr 2013 10:56:05 +0200
Subject: [Buildroot] [PATCH] xenomai: bump to version 2.6.2.1
In-Reply-To: <1366618043-21067-2-git-send-email-victor.hiairrassary.ml@gmail.com>
 (Victor Hiairrassary's message of "Mon, 22 Apr 2013 10:07:23 +0200")
References: <1366618043-21067-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 <1366618043-21067-2-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <87ppxndjve.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Victor" == Victor Hiairrassary <victor.hiairrassary.ml@gmail.com> writes:

 Victor> - remove BR2_PACKAGE_XENOMAI_SMP since xenomai 2.6.2 no more
 Victor> requires to pass the --enable-smp option : see release notes at
 Victor> http://www.xenomai.org/index.php/Xenomai:News#2012-12-26_Xenomai_2.6.2

 Victor> - remove xenomai-thumb-fix.patch since it was completely merged
 Victor> in xenomai 2.6.2

Committed, thanks.

-- 
Bye, Peter Korsgaard
