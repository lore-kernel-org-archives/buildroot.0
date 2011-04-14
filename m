From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Apr 2011 06:26:39 +0000 (UTC)
Subject: [Buildroot] [Bug 3631] New: Error while compiling with Xorg
Message-ID: <bug-3631-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3631

           Summary: Error while compiling with Xorg
           Product: buildroot
           Version: 2011.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: azhar.karnalkar at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi everyone,

I am using Hawkboard as my development board
and arm-none-linux-gnueabi-  as my Toolchain

I was successful on compiling buildroot with TinyX but as I am having a usb
keyboard and usb mouse they are not detected after making the X-server ON.
but I am qiute sure that it detects keyboard which runs in backend.
(ALT+CTRl+DEL)
reboots my board. So I switch for Xorg.

here

I am getting the following error while compiling buildroot for Xorg.
*****************************************************************************
checking for XORG... configure: error: Package requirements (xorg-server >=
1.0.99.901 xproto fontsproto ) were not met:

No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

make: ***
[/home/eclat/Downloads/buildroot-2011.02/output/build/xdriver_xf86-video-fbdev-0.4.1/.stamp_configured]
Error 1

the attachement contains my configuration files

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
