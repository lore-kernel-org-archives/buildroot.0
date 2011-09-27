From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2011 23:36:38 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <1317110841.20688.12.camel@sven>
References: <1317110841.20688.12.camel@sven>
Message-ID: <20110927233638.303328c9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 27 Sep 2011 10:04:12 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> What could possibly be wrong here? Is there anything else I need to
> change when changing the version of gcc?

Other questions:

 * Is your CPU-specific compiler flags properly set ? Maybe they were
   slightly wrong but working with gcc 4.3, and they no longer generate
   appropriate code for your CPU with gcc 4.6. What is your CPU ? What
   CPU-specific compiler flags are you using ?

 * Did you try to do 'ulimit -c unlimited' before running one of those
   binaries, and then inspect the resulting core file ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
