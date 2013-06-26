From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2013 09:49:27 +0000 (UTC)
Subject: [Buildroot] [Bug 6344] New: Wrong handling of license text files
 with same name and different directory
Message-ID: <bug-6344-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6344

           Summary: Wrong handling of license text files with same name
                    and different directory
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


Use e2fsprogs as example

License files given there are:
COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h

Not both files (COPYING and lib/uuid/COPYING) are copied in
output/legal-info/licenses/e2fsprogs because with the same name.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
