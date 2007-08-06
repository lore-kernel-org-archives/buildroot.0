From: Benjamin Tietz <benjamin@micronet24.de>
Date: Mon, 6 Aug 2007 10:32:29 +0200
Subject: [Buildroot] [Patch] internal toolchain for avr32
Message-ID: <20070806083229.GB4699@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I added some patches and support for the avr32-architecture using the
internal toolchain.
Support for Linux 2.6.20, gcc 4.1.2 and uclibc 0.9.29.
I hope i didn't missed a thing in the patch.

It (~600kB) can be found under
http://www.micronet24.de/pub/avr32-internal-toolchain.patch.bz2

regards
Benjamin

PS: I don't like the idea of prepatched sources, since I'm compiling for
multiple architectures this would really increase the amount of data to
download
