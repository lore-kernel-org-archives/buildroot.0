From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2008 23:26:24 +0100
Subject: [Buildroot] [PATCH] target/makedev: fix compile breakage from
 unused result warning
In-Reply-To: <1227570086.584828.33608303487.qpush@pingu>
References: <1227570086.584828.33608303487.qpush@pingu>
Message-ID: <20081202232624.64254046@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 25 Nov 2008 10:41:26 +1100,
Jeremy Kerr <jk@ozlabs.org> a ?crit :

> This change adds a simple warning if system() fails.

Thanks, applied as r24236.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
