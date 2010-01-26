From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Jan 2010 21:46:09 +0000 (UTC)
Subject: [Buildroot] [Bug 985] New: Bump usb_modeswitch package to 1.1.0
Message-ID: <bug-985-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=985

              Host: i686-linux
            Target: arm-linux-ucibcgnueabi
           Summary: Bump usb_modeswitch package to 1.1.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel at bristot.eti.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1003)
 --> (https://bugs.busybox.net/attachment.cgi?id=1003)
Bump usb_modeswitch package to 1.1.0

Major fixes in the wrapper script (stabilizing and time-saving); back to
unified installation, defaults to "integrated" approach; new -D parameter to
enable "integrated" behaviour; bugs fixed in success check; man file included
(borrowed from the Debian package); C code and binary works with the compat
library from libusb-1.0; some new devices


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
