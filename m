From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2015 15:09:36 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] New: When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
Message-ID: <bug-8011-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

           Summary: When building only busybox and strace, strace fails on
                    not finding bluetooth/bluetooth.h
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jaap at jcz.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When I am building a (very small cpio initramfs) buildroot configuration,
strace fails if only busybox & strace are build.
Probably strace configure see my system bluetooth/bluetooth.h which is not
present in sysroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
