From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2009 09:15:33 +0000 (UTC)
Subject: [Buildroot] [Bug 823] New: Editor backup files (~) is copied from
 the target_skeleton.
Message-ID: <bug-823-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=823

           Summary: Editor backup files (~) is copied from the
                    target_skeleton.
           Product: buildroot
           Version: 2009.11
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: anders.darander at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=861)
 --> (https://bugs.busybox.net/attachment.cgi?id=861)
Patch to rm *~-files in the TARGET_DIR.

While editing files in the target_skeleton, quite a few editors create
backup-files with tilde appended to the file names. It would be nice to not
have these copied to the TARGET_DIR, while creating the target root fs.

Attached is a patch, that handles these files in the same manner as
CVS-directories and .empty-files are handled.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
