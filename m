From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Apr 2012 13:38:28 +0000 (UTC)
Subject: [Buildroot] [Bug 5138] New: Add dropbear config option to allow
	blank passwords
Message-ID: <bug-5138-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5138

           Summary: Add dropbear config option to allow blank passwords
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4292
  --> https://bugs.busybox.net/attachment.cgi?id=4292
Patch to add dropbear config option to allow blank passwords

Add a configuration option to allow enabling dropbear's ALLOW_BLANK_PASSWORD
feature.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
