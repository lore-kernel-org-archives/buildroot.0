From: Ian Eperson <ian.eperson@dedf.co.uk>
Date: Fri, 5 Jul 2013 02:04:04 -0700 (PDT)
Subject: [Buildroot] Antw:Re:  libgcc build fails on Fedora15
In-Reply-To: <72a087c6ebedc.4e7e366e@home.nl>
References: <7290940beabd3.4e7df687@home.nl> <20110924174825.131f8fee@skate>
 <72a087c6ebedc.4e7e366e@home.nl>
Message-ID: <1373015044930-47930.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Was there any resolution, or even progress, on the (apparent) legacy
Fedora:Buildroot incompatibility?

I am getting the same error (libgcc_s.so.1: ELF file OS ABI invalid) across
a variety of Buildroots from 2009, 2010, 2011 with Fedora Core 16.

Any guidance would be useful.  Is moving Fedora forward or back likely to
overcome this (or moving to some other development platform)?  Would moving
forward or back with Buildroot be a better strategy?

The target is for a mature Atmel ARM9 SOC.  The assumption was that
(roughly) aligning the platform, target and Buildroot versions in time was
likely to maximize compatibility.  Clearly not. 

Regards



Ian 



 
 
 
 




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/libgcc-build-fails-on-Fedora15-tp2493p47930.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
