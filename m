From: apin prastya <apin.klas@gmail.com>
Date: Sun, 13 Aug 2017 21:32:06 +0700
Subject: [Buildroot] Orange Pi HDMI to VGA output
Message-ID: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I have successfully build the orangepi_one_defconfig. And able to boot and
output to serial console.
Its been a while I struggle with the HDMI output (I am using HDMI to VGA
converter) and no success to make the console output to HDMI.

Here what i have done so far :

   1. enable sunxi board on buildroot config and set the .fex to
   a20/orangepi.fex (attached orangepi.fex)
   2. modify the boot.cmd to : setenv bootargs console=ttyS0,115200
   console=tty0 console=tty1 hdmi.audio=EDID:0
   disp.screen0_output_mode=1280x720p60 root=/dev/mmcblk0p2 rootwait panic=10

Anyone has clue to enable HDMI output please let me know.
Thanks,

-- 
Apin,
Indonesia
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170813/562c3d68/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: orangepi.fex
Type: application/octet-stream
Size: 28490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170813/562c3d68/attachment.obj>
