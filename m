From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2009 09:31:32 +0100
Subject: [Buildroot] MIPS arch on NPTL branch
In-Reply-To: <49AC5D4D.3030600@katalix.com>
References: <49AC5D4D.3030600@katalix.com>
Message-ID: <20090303093132.00de3467@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 02 Mar 2009 22:27:25 +0000,
James Chapman <jchapman@katalix.com> a ?crit :

> Just wondering what the status of the MIPS arch is on the uclibc-NPTL
> branch tip.  I'm seeing compile errors because _dl_find_hash() now has
> an extra argument. Is MIPS missing an update after generic ldso
> changes? Perhaps someone is already working on this?

This question seems to belong to the uclibc list rather than the
Buildroot list.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
