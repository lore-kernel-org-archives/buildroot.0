From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2013 09:38:18 +0000 (UTC)
Subject: [Buildroot] [Bug 6338] New: Wrong download link for minicom package
Message-ID: <bug-6338-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6338

           Summary: Wrong download link for minicom package
           Product: buildroot
           Version: 2013.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aleksandar.zivkovic at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


-MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
