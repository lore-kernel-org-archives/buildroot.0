From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Feb 2011 10:08:12 +0000 (UTC)
Subject: [Buildroot] [Bug 3259] New: Unable to build webkit (on arm).
Message-ID: <bug-3259-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3259

           Summary: Unable to build webkit (on arm).
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: noel.vellemans at visionbms.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2971
  --> https://bugs.busybox.net/attachment.cgi?id=2971
Webkit - Error snippet.

version Git-buildroot (17/02/2011)

Webkit fails to build (for arm). 

undefined reference(s) to :

`u_charType_44' `u_strToUpper_44' `ucol_close_44' `ucol_getLocaleByType_44'
`ucol_getAttribute_44' `ucol_open_44' `ucol_open_44'
`ucol_setAttribute_44'... etc...

I guess has something to do with icu.

Regards Noel

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
