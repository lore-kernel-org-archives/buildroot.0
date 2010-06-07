From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 20:17:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1975] New: Package removal/deprecation
Message-ID: <bug-1975-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1975

           Summary: Package removal/deprecation
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1921
  --> https://bugs.busybox.net/attachment.cgi?id=1921
Deprecate rp-pppoe

Deprecate rp-pppoe since the pppoe plugin has been included in the pppd package
for some time now.
Remove portage, since our really old version can't handle modern portage trees.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
