From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Nov 2010 21:34:34 +0000 (UTC)
Subject: [Buildroot] [Bug 2839] New: compile fails in various packages with
 a odd message "error: impossible constraint in 'asm'"
Message-ID: <bug-2839-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2839

           Summary: compile fails in various packages with a odd message
                    "error: impossible constraint in 'asm'"
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sergio at sergiomb.no-ip.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2677
  --> https://bugs.busybox.net/attachment.cgi?id=2677
make libmad  >& errors.txt

With buildroot git version , I got several packages which I got this odd errror 

make libmad  >& errors.txt

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
