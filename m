From: Eric Limpens <eric@limpens.net>
Date: Mon, 31 Dec 2007 10:45:44 +0100
Subject: [Buildroot] Illegal instruction mplayer / at91sam9263
Message-ID: <20071231104544.44afd07e@wsEric3.NOC-office.hscg.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hello, I'm trying to build some applications for an Atmel
at91sam9263-EK. Does anyone know, if the error below is due to some
optimization of mplayer or a library?

In either case, anyone who does know the proper configure flags, so it
doesn't crash on the 'Illegal instruction' ?

TIA,  Eric.






MPlayer 1.0rc1.atmel.2-4.2.1 (C) 2000-2006 MPlayer Team
CPU: ARM

Playing /mnt/usb/videos/v_trai~1.avi.
AVI file format detected.
VIDEO:  [XVID]  320x180  12bpp  24000 fps   2739 kbps ( 334 kbyte/s)
Clip info:
 Software: MEncoder 1.0pre7-4.0.2
==========================================================================
Opening video decoder: [ffmpeg] FFmpeg's libavcodec codec family
Illegal instruction
