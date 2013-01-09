From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 18:57:25 +0100
Subject: [Buildroot] compressed file system
In-Reply-To: <1357754022866-38293.post@n4.nabble.com>
References: <1357754022866-38293.post@n4.nabble.com>
Message-ID: <20130109185725.7b568bb6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear tallu,

On Wed, 9 Jan 2013 09:53:42 -0800 (PST), tallu wrote:

> I'm new to Linux and to Buildroot.
> I've succeeded to build a kernel and a file system (.ext2) and to
> test it with QEMU.
> Now I'm trying to use a compressed file system (.ext2.gz) but it will
> not load (kernel panic).
> 
> How should I load a compressed file system which is the rootfs?

If you use this filesystem as a hard disk image, i.e the '-hda
rootfs.ext2' Qemu option, then it has to be uncompressed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
