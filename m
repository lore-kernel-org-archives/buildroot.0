From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Apr 2009 23:30:47 +0000 (UTC)
Subject: [Buildroot] [Bug 261] New: Patch to add wxWidgets to Buildroot
Message-ID: <bug-261-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=261

             Build: 2009.02
           Summary: Patch to add wxWidgets to Buildroot
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lloyd at cannasoftware.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The following patch file will add wxWidgets to buildroot.

What has been tested: 

The following options are the only ones tested with this submittal:

--enable-gui=no --disable-precomp-headers --enable-unicode

What has NOT been tested:

The entire GUI widget set as I currently do not use GTK or X11.

Build 2009.02


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
