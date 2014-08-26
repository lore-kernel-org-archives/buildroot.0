From: Malte Forkel <malte.forkel@berlin.de>
Date: Tue, 26 Aug 2014 09:11:10 +0200
Subject: [Buildroot] Building RPi toolchain with 2014.05
Message-ID: <lthbud$oba$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

with buildroot 2013.05, I could create a toolchain for Raspberry Pi with
    $ make rpi_defconfig
    $ make toolchain
If I try the same with buildroot 2014.05, i.e.
    $ make raspberrypi_defconfig
    $ make toolchain
the log ends with
    >>> toolchain-buildroot undefined Extracting
    >>> toolchain-buildroot undefined Patching
    >>> toolchain-buildroot undefined Configuring
    >>> toolchain-buildroot undefined Building
    >>> toolchain-buildroot undefined Installing to target
    >>> toolchain undefined Extracting
    >>> toolchain undefined Patching
    >>> toolchain undefined Configuring
    >>> toolchain undefined Building
    >>> toolchain undefined Installing to target
and the directory output/toolchain is not created.

What am I missing?

Thanks,
Malte
