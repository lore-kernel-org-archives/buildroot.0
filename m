From: J.C. Woltz <jwoltz@gmail.com>
Date: Mon, 6 Feb 2012 16:53:25 -0500
Subject: [Buildroot] New Board Support and process
Message-ID: <CAC78GpfSiOFDHwJ243n+t81ub-Bchs7gWs_16wjrEseiVCLF_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been maintaining my own branch of buildroot for the Synapse Wireless
E10.
http://www.synapse-wireless.com/index.php?mainID=3&subID=10&type=product&prodID=10

From a linux point of view, it is an Atmel AT91SAM9G20 based machine.
I have patches for u-boot, linux, a linux config, and a buildroot
e10_defconfig.
Except for the e10_defconfig, the files are located under
board/synapse/e10/.
Can I submit these as a patch, or is there a preferred alternative?

I have also updated usb_modeswitch to version 1.2.3 and created a package
for usb_modeswitch_data which contains udev rules among other things.

I would like to submit these and have them available in future releases.
That way other users of the E10 have an easier time making custom builds.

Thoughts? Objections? Other?

Thank you,
J.C. Woltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120206/74804da6/attachment.html>
