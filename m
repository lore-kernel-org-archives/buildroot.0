From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 13:54:03 +0200
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
In-Reply-To: <503D63DF.8060803@mind.be>
References: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
 <20120829011800.01eb081e@skate> <503D63DF.8060803@mind.be>
Message-ID: <20120829135403.2af6eb43@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 29 Aug 2012 02:35:43 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   Maybe we should temporarily add something like
> 
> GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval 
> $$$$(generic-host-package)))

Care to send a patch for this (and the AUTOTARGETS, CMAKETARGETS as
well) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
