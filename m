From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Oct 2010 06:25:12 +0000 (UTC)
Subject: [Buildroot] [Bug 2683] New: cups does not install correctly to
	target
Message-ID: <bug-2683-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2683

           Summary: cups does not install correctly to target
           Product: buildroot
           Version: 2010.05
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: marcus.osdoba at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2587
  --> https://bugs.busybox.net/attachment.cgi?id=2587
cups 1.4.4 and autotargets

cups installs its libraries into user/lib64, the attached patch converts to
autotargets and updates to newer version 1.4.4, libraries are installed
correctly, runs well on arm926

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
