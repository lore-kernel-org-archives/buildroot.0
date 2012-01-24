From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2012 10:32:21 +0100
Subject: [Buildroot] Add rt squarewave example in buildroot
In-Reply-To: <loom.20120124T085832-891@post.gmane.org>
References: <loom.20120123T152253-656@post.gmane.org>
 <20120123221407.2d5f5043@skate>
 <loom.20120124T085832-891@post.gmane.org>
Message-ID: <20120124103221.1f769dba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Jan 2012 08:07:04 +0000 (UTC),
Willy <willy@willygroup.org> a ?crit :

> I'm using the generated toolchain with the default configuration.

Strange, the uClibc is by default compiled with
UCLIBC_HAS_ADVANCED_REALTIME, clock_nanosleep() should be there in
librt. Can you try with a test case program?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
