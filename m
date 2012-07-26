From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 08:53:27 +0200
Subject: [Buildroot] [PATCH 0/2] qemu mips64 sample config
In-Reply-To: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120726085327.34b7add7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 25 Jul 2012 18:24:11 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> This is a small set that introduces the mips64 qemu sample configuration.
> It's prerequisite is my mips64 tuple patch or Thomas's updated patch that
> enables the mips64 tuple also.
> Tested with qemu 1.1.1 it's flaky, i can't say for sure if it's a toolchain,
> qemu and/or kernel configuration issue since i lack real mips64 hardware to
> test on.
> The biggest issue is login segfaulting so you can't login to the new sample
> shiny emulation, though you can append the old init=/bin/sh to get things
> rolling somehow, though you'll get some other segfaults eventually.

Do you mind if I ask this information to the readme.txt file, so that
the documentation doesn't pretend that it works perfectly if it
doesn't?

Also, with which Qemu version did you try? Did you try with the latest
Git? I was told that some mips64 fixes were merged recently in Qemu.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
