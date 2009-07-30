From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 13:26:16 +0000 (UTC)
Subject: [Buildroot] [Bug 511] New: New package usb_modeswitch
Message-ID: <bug-511-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=511

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: New package usb_modeswitch
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.draisberghof.de/usb_modeswitch/
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=523)
 --> (https://bugs.busybox.net/attachment.cgi?id=523)
New package usb_modeswitch

The usb_modeswitch program allows to switch usb device modes.
It is usually used for some 3G modems that present itself as mass storage
devices by default instead of usb serial. This is done because they contain a
small flash device with the drivers inside or also feature a *SD card reader.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
