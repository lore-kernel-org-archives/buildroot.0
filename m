From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Sep 2012 11:22:36 +0200
Subject: [Buildroot] [PATCH 2/4] New top-level directory: system
In-Reply-To: <201209042253.05822.yann.morin.1998@free.fr>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <bf2cdf7779649494ec8e4436a75c6d22b79d2a7b.1346767209.git.thomas.petazzoni@free-electrons.com>
 <201209042253.05822.yann.morin.1998@free.fr>
Message-ID: <20120905112236.09691dad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Sep 2012 22:53:05 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > Even though the skeleton and device tables could have lived in fs/, it
> > would have been strange to have the UART, system hostname and other
> > related options into fs/. A new system/ directory makes more sense.
> 
> Agreed. The fs/ sub-dir is now only for all the different rootfs methods.
> I'm not too fond of the 'system' name, but I can see anything else that
> would be fit.

I don't have a strong preference for 'system' either, but that's the
only name I could find that was reasonable. Suggestions welcome.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
