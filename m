From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Sep 2009 17:43:32 +0000 (UTC)
Subject: [Buildroot] [Bug 621] New: BR2_USE_WCHAR does not seem to enable
 WCHAR support in uClibc
Message-ID: <bug-621-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=621

             Build: buildroot-2009.08-2009.09.18
           Summary: BR2_USE_WCHAR does not seem to enable WCHAR support in
                    uClibc
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sethml at ofb.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I just built withe BR2_USE_WCHAR=y, and that does not seem to enable WCHAR
support in uClibc - it looks like the variable just isn't hooked up properly?

I can provide more details if you can't replicate.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
