From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Nov 2011 16:52:06 +0100
Subject: [Buildroot] Buildroot U-boot user patch applying problem
In-Reply-To: <B55DD04487614DE2890707C4FF7B640E@NX5000J> (Jerzy Grzegorek's
 message of "Sat, 19 Nov 2011 14:17:17 +0100")
References: <B55DD04487614DE2890707C4FF7B640E@NX5000J>
Message-ID: <8739dkrty1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> Hi,
 Jerzy> Buildroot U-boot user patch name shoud be formated
 Jerzy> u-boot-<version>-<descryption>.patch
 
 Jerzy> buildroot-2011.11.rc2  patch

You can argue both for u-boot-*.patch and uboot-*.patch (E.G. like the
.mk file is named). By now, people are using the uboot-*.patch
convention, so I won't change it.

Just rename your patches.

-- 
Bye, Peter Korsgaard
