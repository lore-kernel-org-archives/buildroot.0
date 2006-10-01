From: mike <wtf62@rovoreed.com>
Date: Sun, 01 Oct 2006 07:00:25 +0000
Subject: [Buildroot] Setting up a new kernel with modules ?
Message-ID: <1159686025.3472.7.camel@glynys>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've had Buildroot running for a couple of years on a (386) development
machine that was running a 2.2.16 kernel developing code for a 2.4.31
based target system. My root file system I gzip into fs.gz and unpack
onto ram disk when my target system boots the kernel specified by
syslinux.  Everything was OK.

I've just upgraded my development machine to Fedora Core 4 and at the
same time took the decision to upgrade my target environment to 2.6.12.

I've rebuilt my target kernel and buildroot but seem to be missing some
information on how to complete the upgrade.

I've done a...

make INSTALL_PATH=/home/mike/buildroot/build_i386/root install

but that just seems to have moved the kernel image into my root system,
which isn't exactly what I wanted or expected. Also I've not got the
various compiled modules copied into my root filesystem.

So how do I get the various modules copied into my root file system ? Am
I expected to copy them into the right places myself or is there a
script or something I've forgotten about ?
