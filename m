From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Oct 2013 23:06:45 +0000 (UTC)
Subject: [Buildroot] [Bug 6620] New: Sysvinit package missing killall5 and
 symlinks - patch included
Message-ID: <bug-6620-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6620

           Summary: Sysvinit package missing killall5 and symlinks - patch
                    included
           Product: buildroot
           Version: 2013.08
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5096
  --> https://bugs.busybox.net/attachment.cgi?id=5096
sysvinit missing symlinks

Sysvinit package does not include some symlinks, like shutdown, poweroff and
pidof. They are important to keep system compatibility with scripted files.

This only happens when busybox is not selected on system build.


Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
