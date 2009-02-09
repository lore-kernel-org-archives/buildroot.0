From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Feb 2009 21:29:24 +0000 (UTC)
Subject: [Buildroot] [Bug 95] New: XGI version mismatch
Message-ID: <bug-95-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=95

           Summary: XGI version mismatch
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xgiguy at mailinator.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=53)
 --> (https://bugs.busybox.net/attachment.cgi?id=53)
This fixes x11r7 to download the correct version of the XGI video driver

the latest rc for buildroot tries to download an invalid version of
xdriver_xf86-video-xgi (xf86-video-xgi-1.3.0.tar.bz2).  It looks like it is
supposed to be using xf86-video-xgi-1.5.0.tar.bz2, but has probably not been
tested.  See the attached patch.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
