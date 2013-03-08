From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Mar 2013 04:22:25 +0000 (UTC)
Subject: [Buildroot] [Bug 6080] New: Git fetch caching
Message-ID: <bug-6080-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6080

           Summary: Git fetch caching
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: acooks at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When using the Custom Git tree kernel option, changes to the git repository are
not detected by buildroot. Even a 'make clean' doesn't remove the stale cached
sources. 

Please provide a way to use a local git repo directly, without any caching.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
