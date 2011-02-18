From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:48:05 +0000 (UTC)
Subject: [Buildroot] [Bug 3307] New: synergy fails to build due to missing
	XTest library
Message-ID: <bug-3307-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3307

           Summary: synergy fails to build due to missing XTest library
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


checking for XTestQueryExtension in -lXtst... no
configure: error: You must have the XTest library to build synergy
make: *** [/home/test/outputs/test-382/build/synergy-1.3.1/.stamp_configured]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
