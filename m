From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jul 2010 20:29:30 +0000 (UTC)
Subject: [Buildroot] [Bug 2167] New: Bump busybox to 1.17.0,
 convert to gentargets, drop 1.12, deprecate 1.13 and 1.15
Message-ID: <bug-2167-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2167

           Summary: Bump busybox to 1.17.0, convert to gentargets, drop
                    1.12, deprecate 1.13 and 1.15
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2173
  --> https://bugs.busybox.net/attachment.cgi?id=2173
Bump busybox to 1.17.0, convert to gentargets, drop 1.12, deprecate 1.13 and
1.15

Bump busybox package to 1.17.0.
Convert package to gentargets infra.
Drop version 1.12.x.
Mark 1.13.x as deprecated (wasn't for some odd reason).
Mark 1.15.x as deprecated now that 1.17.x is out.

Give it a good spin since it's a big change.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
