From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Nov 2012 10:02:46 +0000 (UTC)
Subject: [Buildroot] [Bug 5702] New: python3 should install a "python"
	symbolic link
Message-ID: <bug-5702-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5702

           Summary: python3 should install a "python" symbolic link
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: maxime.ripard at free-electrons.com
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When the Python 3 package is selected, and Python 2 is not selected, then
Python 3 should install a python -> python3 symbolic link in /usr/bin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
