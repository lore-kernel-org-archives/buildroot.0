From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Sep 2009 18:14:16 +0000 (UTC)
Subject: [Buildroot] [Bug 597] New: (REOP) Selecting busybox in buildroot's
 config clobbers ar (and probably other binutils)
Message-ID: <bug-597-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=597

           Summary: (REOP)  Selecting busybox in buildroot's config clobbers
                    ar (and probably other binutils)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: felix.nawothnig at drdannenberg.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Quoting the original bug, #0000536:

> Using buildroot from 20051105 I run into a problem trying to compile apps
> in my target system due to the fact that busybox's mini apps clobber the
> real binutils in buildroot.  This is most noticable with ar for which the
> busybox version cannot create archives as is necessary to compile many
> apps/tools.
>
> ---------------------------------------------------------------------- 
>  vapier - 11-07-05 18:38  
> ---------------------------------------------------------------------- 
> this was disabled a while ago:
> $ grep _AR package/busybox/busybox.config
> # CONFIG_AR is not set 

But now... both busybox 1.11.x.config and 1.13.x.config have CONFIG_AR=y
(again).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
