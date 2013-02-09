From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  9 Feb 2013 14:05:53 +0000 (UTC)
Subject: [Buildroot] [Bug 5906] New: collectd client headers not exported
Message-ID: <bug-5906-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5906

           Summary: collectd client headers not exported
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fli4l at carsten-spiess.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The headers needed to compile unixsock clients using the collectd/client.h
include are not exported by the collectd package.

Reason:
in collectd.mk the line:
  COLLECTD_INSTALL_STAGING = YES
is missing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
