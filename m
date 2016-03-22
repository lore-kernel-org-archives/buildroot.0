From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Mar 2016 21:07:48 +0100
Subject: [Buildroot] [PATCH 1/3] ffmpeg: bump to version 3.0
References: <1458309966-16835-1-git-send-email-Vincent.Riera@imgtec.com>
 <n5ktrcx0us.ln2@ID-313208.user.individual.net> <56EC2AED.3090803@imgtec.com>
 <XnsA5CFB7247A9CBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <56EC35DD.60804@imgtec.com>
 <XnsA5CFCC40DEAC4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <XnsA5D3D6F23E7C2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:XnsA5CFCC40DEAC4berndkuhlsPkbjNfxxIA at bernd-kuhls.de:

> Vicente Olivert Riera <Vincent.Riera-
1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> 
> wrote in news:56EC35DD.60804 at imgtec.com:
> 
>> don't you prefer to backport that Gentoo patch into Buildroot?
> 
> Hi Vicente,
> 
> that?s exactly what I am planing to do combined with a runtime test.

Hi Vicente,

one hour ago I started with the runtime test:

20:11:53 T:3027584768  NOTICE: Starting Kodi (16.1-RC2 
Git:a7caa16680f09810). Platform: Linux x86 32-bit
20:11:53 T:3027584768  NOTICE: Using Debug Kodi x32 build
20:11:53 T:3027584768  NOTICE: Kodi compiled Mar 22 2016 by GCC 4.9.2 for 
Linux x86 32-bit version 3.14.25 (200217)
20:11:53 T:3027584768  NOTICE: Running on fli4l 3.10.5-r45046-testing 0.0, 
kernel: Linux x86 32-bit version 3.18.29-nonfree
20:11:53 T:3027584768  NOTICE: FFmpeg version: 3.0
20:11:53 T:3027584768  NOTICE: Host CPU: Intel(R) Core(TM) i3-4330T CPU @ 
3.00GHz, 4 cores available

So far looking good, no crashes, CPU load like before. I will continue to 
test for a few days, especially because popcornmix, a Team-Kodi member, 
wrote

http://forum.kodi.tv/showthread.php?tid=264007&pid=2278559#pid2278559

and OpenELEC did not bump yet: 
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/multimedia/ffm
peg/package.mk

The Kodi project itself already prepared the ffmpeg bump:
https://github.com/xbmc/FFmpeg/commits/release/3.0-xbmc

but did not commit it yet: 
https://github.com/xbmc/xbmc/blob/master/tools/depends/target/ffmpeg/FFMPEG
-VERSION

Regards, Bernd
