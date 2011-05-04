From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 4 May 2011 10:38:31 -0700
Subject: [Buildroot] modules.conf <hunnh?>
Message-ID: <BANLkTimw6QVRy=JP5k=XNG=jnOeRZmSwmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm a little confused this morning in trying to work out how to load modules
at startup with a buildroot created busybox rootfs.

I *thought* all that was required to load modules was to create a
"/etc/modules.conf" file and list the kernel modules to load in it.

But, now I *think* that there needs to be an "rc" reference somewhere to
trigger the loading of modules.

A google sends me around "rc.modules" and "rc.local", neither of which exist
in busybox, I I *buess* that we have a somewhat simplified model for loading
modules on startup.

So, I *believe* I can explicitly put each "modprobe" in rcS, but I wonder if
there is a more-proper way to do it in busybox?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110504/f7347265/attachment.html>
