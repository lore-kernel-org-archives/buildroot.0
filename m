From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Jun 2010 16:44:16 +0000 (UTC)
Subject: [Buildroot] [Bug 2137] New: Support rc versions of kernel headers
Message-ID: <bug-2137-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2137

           Summary: Support rc versions of kernel headers
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


buildroot does not currently support building against rc versions of kernel
headers. The download step fails because the download directory differs between
rc and final kernel releases. This patch tries to detect when an rc kernel is
being used and download from the correct location.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
