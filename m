From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Feb 2010 15:56:20 +0000 (UTC)
Subject: [Buildroot] [Bug 1093] New: [PATCH] Upgrade libusb to v1.0.3 and
 add new libusb-compat package for compatibility with old packages that
 expect the pre-1.0 API.
Message-ID: <bug-1093-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1093

           Summary: [PATCH] Upgrade libusb to v1.0.3 and add new libusb-
                    compat package for compatibility with old packages that
                    expect the pre-1.0 API.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mac at mcrowe.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1099)
 --> (https://bugs.busybox.net/attachment.cgi?id=1099)
Upgrade to libusb v1.0.3 and introduce libusb-compat

Upgrade libusb to v1.0.3.

Add new libusb-compat package for compatibility with old packages.

Switch to using AUTOTARGETS while we're at it.

I'm not certain that libusb-compat-0.1.3-pkgconfig.patch is essential
but it doesn't seem to do any harm.

Also update usb_modeswitch to depend on libusb-compat rather than
libusb.

Originally posted to mailing list at:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/19727


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
