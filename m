From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 Dec 2012 23:55:04 +0000 (UTC)
Subject: [Buildroot] [Bug 5750] New: buildroot-2012.11 while building X11
 for ARM, errors on  xlib_libX11-1.4.2
Message-ID: <bug-5750-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5750

           Summary: buildroot-2012.11 while building X11 for ARM, errors
                    on  xlib_libX11-1.4.2
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rdghx at 163.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4670
  --> https://bugs.busybox.net/attachment.cgi?id=4670
config file

CC     Sync.lo
  CC     Synchro.lo
  CC     Text16.lo
  CC     Text.lo
  CC     TextExt16.lo
  CC     TextExt.lo
  CC     TextToStr.lo
  CC     TrCoords.lo
  CC     UndefCurs.lo
  CC     UngrabBut.lo
  CC     UngrabKbd.lo
  CC     UngrabKey.lo
  CC     UngrabPtr.lo
  CC     UngrabSvr.lo
  CC     UninsCmap.lo
  CC     UnldFont.lo
  CC     UnmapSubs.lo
  CC     UnmapWin.lo
  CC     VisUtil.lo
  CC     WarpPtr.lo
  CC     Window.lo
  CC     WinEvent.lo
  CC     Withdraw.lo
  CC     WMGeom.lo
  CC     WMProps.lo
  CC     WrBitF.lo
  CC     xcb_disp.lo
  CC     xcb_io.lo
  CC     XlibAsync.lo
  CC     XlibInt.lo
  CC     Xrm.lo
XlibInt.c: In function '_XPrintDefaultError':
XlibInt.c:1433:5: warning: format not a string literal, argument types not
checked
XlibInt.c:1453:2: warning: format not a string literal, argument types not
checked
XlibInt.c:1485:6: warning: format not a string literal, argument types not
checked
XlibInt.c:1513:2: warning: format not a string literal, argument types not
checked
XlibInt.c:1519:5: warning: format not a string literal, argument types not
checked
XlibInt.c:1523:5: warning: format not a string literal, argument types not
checked
  CC     x11_xcb.lo
  CCLD   libX11.la
libtool: link: warning: library
`/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libxcb.la'
was moved.
/bin/grep:
/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libXau.la:
No such file or directory
/bin/sed: can't read
/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libXau.la:
No such file or directory
libtool: link:
`/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/work/buildroot/buildroot-2012.11/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libXau.la'
is not a valid libtool archive
make[4]: *** [libX11.la] Error 1
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.11/output/build/xlib_libX11-1.4.2/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.11/output/build/xlib_libX11-1.4.2/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/usr/work/buildroot/buildroot-2012.11/output/build/xlib_libX11-1.4.2/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/usr/work/buildroot/buildroot-2012.11/output/build/xlib_libX11-1.4.2'
make: ***
[/usr/work/buildroot/buildroot-2012.11/output/build/xlib_libX11-1.4.2/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
