From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Feb 2011 20:43:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3343] New: Add file:// download SITE_METHOD
Message-ID: <bug-3343-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3343

           Summary: Add file:// download SITE_METHOD
           Product: buildroot
           Version: 2010.11
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rgbmj at tricolour.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3043
  --> https://bugs.busybox.net/attachment.cgi?id=3043
patch to add support for SITE_METHODS scp, file(cp), rsync

Add SITE_METHODs for flexibility and development ease.  Since http, ftp and
git, svn and bzr are already supported, I added the "file://", scp and rsync
SITE_METHODs for ease of development before migrating to git.  Since this is a
proof of concept, feedback is sought about how appropriate these are.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
