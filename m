From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Dec 2010 16:30:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2905] New: Qt: Speed up compilation,
 if gui-module isn't selected
Message-ID: <bug-2905-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2905

           Summary: Qt: Speed up compilation, if gui-module isn't selected
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2779
  --> https://bugs.busybox.net/attachment.cgi?id=2779
patch to disable gui-module

By default the gui-module is built.

With the appended patch building is disabled, if gui-module isn't selected via
configuration.

Frederik Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
