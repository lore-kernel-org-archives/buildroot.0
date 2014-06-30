From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Jun 2014 21:04:12 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] New: Cannot build with -std=c++11
Message-ID: <bug-7250-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

           Summary: Cannot build with -std=c++11
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tarka.t.otter at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5468
  --> https://bugs.busybox.net/attachment.cgi?id=5468
c++11 test case

After building a buildroot toolchain based on GCC 4.8.3, it does not seem
possible to build any packages that require C++11 support.

Attached is a simple test case that compiles fine on my host machine with GCC
4.8.2 with -std=c+11, but fails to compile using the cross toolchain with the
same flag.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
