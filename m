From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Fri, 17 Feb 2012 20:35:29 +0000
Subject: [Buildroot] BR 2012.02-rc1 :: WODIM issue (linking stage)
In-Reply-To: <CAPEB33yG=-ETJSRQZgAAz45Lpu+2XWURiGRGRkzfFfaawt6d+w@mail.gmail.com>
References: <CAPEB33yG=-ETJSRQZgAAz45Lpu+2XWURiGRGRkzfFfaawt6d+w@mail.gmail.com>
Message-ID: <CAPEB33w1eEb5Efv+15-PG9QT4LRKSASz69tBspHWoASiV-w9hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody!
using the 2012.02-rc1 release of buildroot I felt into the following issue
which concern WODIM during the linking stage. It probably miss a file or a
directory not set in a good path. How I can find exactly what is missing?

"
> Linking C executable wodim
> cd
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/wodim
> && /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/bin/cmake -E
> cmake_link_script CMakeFiles/wodim.dir/link.txt --verbose=1
> /usr/bin/gcc
>  -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/include
>  -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/lib
> -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/lib
> -Wl,-rpath,/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/lib
> CMakeFiles/wodim.dir/wodim.o CMakeFiles/wodim.dir/audiosize.o
> CMakeFiles/wodim.dir/auinfo.o CMakeFiles/wodim.dir/cdr_drv.o
> CMakeFiles/wodim.dir/cdtext.o CMakeFiles/wodim.dir/clone.o
> CMakeFiles/wodim.dir/crc16.o CMakeFiles/wodim.dir/cue.o
> CMakeFiles/wodim.dir/diskid.o CMakeFiles/wodim.dir/drv_7501.o
> CMakeFiles/wodim.dir/drv_jvc.o CMakeFiles/wodim.dir/drv_mmc.o
> CMakeFiles/wodim.dir/drv_philips.o CMakeFiles/wodim.dir/drv_simul.o
> CMakeFiles/wodim.dir/drv_sony.o CMakeFiles/wodim.dir/fifo.o
> CMakeFiles/wodim.dir/isosize.o CMakeFiles/wodim.dir/scsi_cdr_mmc4.o
> CMakeFiles/wodim.dir/scsi_mmc4.o CMakeFiles/wodim.dir/sector.o
> CMakeFiles/wodim.dir/subchan.o CMakeFiles/wodim.dir/wm_packet.o
> CMakeFiles/wodim.dir/wm_session.o CMakeFiles/wodim.dir/wm_track.o
> CMakeFiles/wodim.dir/xio.o  -o wodim -rdynamic -L../librols -L../libusal
> -L../libedc
> -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/libusal
> -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/librols
> -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/wodim
> -L/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/libedc
> ../libusal/libusal.a ../librols/librols.a -lcap libwodimstuff.a
> ../libedc/libedc.a
> make[3]: Leaving directory
> `/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/bin/cmake -E
> cmake_progress_report
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/CMakeFiles
>  85 86 87 88 89 90 91 92 93 94 95 96
> [ 87%] Built target wodim
> make[2]: Leaving directory
> `/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
> make: ***
> [/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/.stamp_built]
> Error 2
> "
>

 thanks for any idea or ways to follow.

-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120217/2890cf78/attachment.html>
