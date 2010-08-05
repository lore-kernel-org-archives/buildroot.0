From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Aug 2010 15:34:16 +0000 (UTC)
Subject: [Buildroot] [Bug 2359] New: [luafilesystem] remove LARGE_FILE
	constraint
Message-ID: <bug-2359-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2359

           Summary: [luafilesystem] remove LARGE_FILE constraint
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: francois.perrad at gadz.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2311
  --> https://bugs.busybox.net/attachment.cgi?id=2311
fix

the attached patch removes the LARGE_FILE constraint for the package
LuaFileSystem in 2010.08-rc1.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
