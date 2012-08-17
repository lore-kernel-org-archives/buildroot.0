From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2012 12:40:46 +0000 (UTC)
Subject: [Buildroot] [Bug 5462] New: webkit doesn't build on directfb
Message-ID: <bug-5462-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5462

           Summary: webkit doesn't build on directfb
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: belzo2005-dolphin at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4502
  --> https://bugs.busybox.net/attachment.cgi?id=4502
webkit build log

Hi all,

I am using 'qemu x86 defconfig' predefined options set with additionnal
packages to build webkit 1.2.7 on directfb.

But it fails on building webkit due to X11 message like:
WebCore/bridge/npapi.h:105:26: fatal error: X11/Xlib.h: No such file or
directory

Please find in attachment config file and webkit log.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
