From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Apr 2014 09:09:56 +0000 (UTC)
Subject: [Buildroot] [Bug 7010] New: jamvm builds and runs fine under mips
	(be)
Message-ID: <bug-7010-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7010

           Summary: jamvm builds and runs fine under mips (be)
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5324
  --> https://bugs.busybox.net/attachment.cgi?id=5324
patch to buildroot to allow mips(be) build of jamvm

Although the website does not include this platform as 'supported', it seems to
work fine and can run the Netalyzr CLI tool[1] with no problems.

Attached a patch that gets it building and running.

[1] http://netalyzr.icsi.berkeley.edu/cli.html

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
