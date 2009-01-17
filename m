From: Dan Lyke <danlyke@flutterby.com>
Date: Sat, 17 Jan 2009 14:08:15 -0800
Subject: [Buildroot] Installing Buildroot built u-boot on an AT91SAM9261EK?
Message-ID: <20090117140815.49509869@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been using Buildroot successfully for the Linux kernel and
filesystem, but I've been using the u-boot that comes with the Angstrom
demo build, with the TCL script that came with it to install it via
SAM-BA.

Now I need to put my own u-boot on the device, but I can't figure out
where  but all of the other u-boots I find, including the ones I build
myself, seem to be looking for the u-boot environment somewhere other
than where the Angstrom TCL script puts it.

When I try to boot I'm getting:

  *** Warning - bad CRC, using default environment

Anyone got a SAM-BA TCL script that puts the Buildroot built u-boot and
associated environment in the right place?

Thanks!

Dan
