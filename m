From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Tue, 04 Sep 2012 11:36:08 +0200
Subject: [Buildroot] moving console traces to a specific tty
Message-ID: <5045CB88.3070406@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm running buildroot on an atom-based board. I've activated getty on tty1 to tty4 and would like kernel traces and
others (all that is started through inittab) to show only on tty5.

For this, I've set the 'console = tty5' in the kernel parameters. Unfortunatly, some traces (the ones that are generated
when I plug or unplug an USB device) keep showing on the active tty, whichever it is.

Is there something else I can do to keep the active tty clean of traces ?

thanks,

-- 
Emmanuel
