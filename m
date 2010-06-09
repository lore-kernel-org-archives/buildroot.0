From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Jun 2010 09:52:54 +0000 (UTC)
Subject: [Buildroot] [Bug 1999] New: Typo in path checking
Message-ID: <bug-1999-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1999

           Summary: Typo in path checking
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nick at leverton.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1987
  --> https://bugs.busybox.net/attachment.cgi?id=1987
Correct variable case in CWD path check.

Following applies to version 2010.05 but it's not in the BZ version list yet.

Trivial typo in toolchain/dependencies/dependencies.sh means that check for
having CWD in patch can fail to detect it.  Attached patch should fix this.

Nick

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
