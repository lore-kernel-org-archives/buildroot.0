From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Sep 2010 16:37:38 +0000 (UTC)
Subject: [Buildroot] [Bug 2563] New: [PATCH] cairo: Expose the configure
 option to disable some floating-point math
Message-ID: <bug-2563-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2563

           Summary: [PATCH] cairo: Expose the configure option to disable
                    some floating-point math
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: Paul.Burton at imgtec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2467
  --> https://bugs.busybox.net/attachment.cgi?id=2467
Exposes cairos --disable-some-floating-point configure option

Cairo has a configure option to disable some code paths which make heavy use of
floating point math. On systems without hardware floating point, this can
improve performance. This patch exposes that option in the buildroot
configuration.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
