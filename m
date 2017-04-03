From: luke <skywal_l@hotmail.com>
Date: Mon, 3 Apr 2017 13:41:09 +0000
Subject: [Buildroot] FFmpeg and Raspberry hardware acceleration
Message-ID: <DB5PR03MB1334E55B35F4807498A5DFD0E7080@DB5PR03MB1334.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RPi have the ability to code/decode in x264 using a hardware device (the VideoCore).

This can be enabled with ffmpeg. It pretty easy to do with buildroot, you just need to activate the rpi-userland package and add a couple of options to the ./configure call in the ffmpeg package.


Is there any interest in merging a patch if I send one?

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170403/f89769ea/attachment.html>
