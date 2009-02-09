From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Feb 2009 11:50:31 +0000 (UTC)
Subject: [Buildroot] [Bug 91] New: vsftpd fails to build with ssl support
Message-ID: <bug-91-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=91

              Host: i386
             Build: i386
           Summary: vsftpd fails to build with ssl support
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: super.firetwister at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


vsftpd fails to build (link) with ssl support because -lcrypto is missing in 
$(VSFTPD_LIBS) in the vsftpd.mk


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
