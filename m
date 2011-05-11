From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 May 2011 15:01:59 +0000 (UTC)
Subject: [Buildroot] [Bug 3703] New: Consider using /usr/bin/env bash in
	scripts
Message-ID: <bug-3703-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3703

           Summary: Consider using /usr/bin/env bash in scripts
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: holger+br at freyther.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


On FreeBSD bash will not be inside /bin/bash but will be in
/usr/local/bin/bash, by using /usr/bin/env bash one can have a script that
works well with a Linux system and FreeBSD.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
