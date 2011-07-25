From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 13:34:33 +0200
Subject: [Buildroot] [PATCH] New package: ti-utils
In-Reply-To: <4DB7D4B0.9020905@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 27 Apr 2011 10:32:48 +0200")
References: <4DB7D4B0.9020905@visionsystems.de>
Message-ID: <87bowisieu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Add the calibrator and other useful utilities for TI wireless solution,
 Yegor> based on wl12xx driver. 

 Yegor> See http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator for
 Yegor> further details.

You missed the 'select BR2_PACKAGE_LIBNL', but I've fixed that -
Committed, thanks.

-- 
Bye, Peter Korsgaard
