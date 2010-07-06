From: Ossy <ossy1980@gmx.net>
Date: Wed, 07 Jul 2010 00:16:46 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
Message-ID: <4C33AB4E.9050604@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot mailinglist,

After successfully compiling a whole rootfs and mounting it via loop on 
some nfs export I started my arm ebedded device and ran into tho 
following error after booting the image via tftp.

"init: I won't write compressed data to a terminal."

The bootargs include a console=ttyS0,115200 and rootfs over nfs options.
I guess there is is an issue with the built in zip/bzip compression.
But why is the init process not able to output to the terminal?
After that error, the kernel panics, so I can't boot into my brand new 
rootfs. (The search function of the mailinglist didn't give a hint...)

Thanks for your help,
Marcus
