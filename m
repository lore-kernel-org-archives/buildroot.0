From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 May 2010 13:24:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1747] New: external toolchain does not include
	mtd-util headers
Message-ID: <bug-1747-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1747

           Summary: external toolchain does not include mtd-util headers
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mensch0815 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


if I build a external toolchain with buildroot the mtd-utils headers won't get
included in usr/include, therfore programs such as fw_printenv fail to build.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
