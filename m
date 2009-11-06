From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2009 10:53:25 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
Message-ID: <20091106105325.440f0373@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 6 Nov 2009 10:26:52 +0100,
Joachim Pihl <jpihl@nevion.com> a ?crit :

> All the crashing applications are built _outside_ the buildroot  
> environment, using the toolchain created by buildroot. This worked  
> perfectly before I started messing with it.

You cannot expect the system to work after more or less randomly
removing libraries, even if they at first sight look useless.

How do you compile your applications exactly ? (Compiler flags, etc.).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
