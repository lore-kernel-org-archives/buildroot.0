From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Jan 2013 12:15:48 +0000 (UTC)
Subject: [Buildroot] [Bug 5852] New: [2012.11] usb_modeswitch should depends
 of "BR2_PACKAGE_TCL_SHLIB_ONLY is not set"
Message-ID: <bug-5852-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5852

           Summary: [2012.11] usb_modeswitch should depends of
                    "BR2_PACKAGE_TCL_SHLIB_ONLY is not set"
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: a_s_y at sama.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


usb_modeswitch_dispatcher is a tcl-script:

#!/usr/bin/tclsh

# Wrapper (tcl) for usb_modeswitch, called from
# /lib/udev/rules.d/40-usb_modeswitch.rules
# (part of data pack "usb-modeswitch-data") via
# /lib/udev/usb_modeswitch

Symlink /usr/bin/tclsh -> tclsh8.4 (or other current tclsh) should be create
also.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
