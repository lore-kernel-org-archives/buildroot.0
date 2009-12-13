From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Dec 2009 02:06:46 +0000 (UTC)
Subject: [Buildroot] [Bug 807] New: [PATCH] samba - make iconv and smbd
	optional
Message-ID: <bug-807-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=807

           Summary: [PATCH] samba - make iconv and smbd optional
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rvpaasen at t3i.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=835)
 --> (https://bugs.busybox.net/attachment.cgi?id=835)
samba patch

This patch add a config option to in/exclude smbd and to build with/without
libiconv. Note: iconv is only needed if samba must support filesystems with
encoding other than ASCII or UTF-8 (e.g. DOS file systems).

The patch can be applied to the current git repository.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
