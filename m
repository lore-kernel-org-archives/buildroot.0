From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Apr 2009 03:36:36 +0000 (UTC)
Subject: [Buildroot] [Bug 271] New: Library 'libgcc_s.so.1' not installed in
	search path
Message-ID: <bug-271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=271

            Target: x86-64
             Build: buildroot-20090412
           Summary: Library 'libgcc_s.so.1' not installed in search path
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When booting the target system created by buildroot, I get a lot of "can't load
library 'libgcc_s.so.1'" messages.

The library exists in the folder /usr/lib64, but it seems that folder is not in
the default ld search path.
System works fine after copying the library to /lib


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
