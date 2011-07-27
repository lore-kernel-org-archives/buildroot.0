From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2011 09:51:18 +0200
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <871uxcuqg0.fsf@macbook.be.48ers.dk>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <871uxe10hq.fsf@macbook.be.48ers.dk>
 <4E2E67C8.7090208@visionsystems.de>
 <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
 <871uxcuqg0.fsf@macbook.be.48ers.dk>
Message-ID: <20110727095118.6eec6b5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 27 Jul 2011 09:34:55 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> You cannot, kernel headers are part of the toolchain. Consider moving
> to a newer toolchain and/or disable UDEV_EXTRAS.

Or, if it's just a matter of defining BTN_TRIGGER_HAPPY, you can patch
the udev source code to that it defines this constant if it's not
already defined. This is a bit hackish, but it's true that not
supporting CodeSourcery 2010q1 is a bit problematic.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
