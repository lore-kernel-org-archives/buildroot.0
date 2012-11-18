From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Nov 2012 20:24:58 +0000 (UTC)
Subject: [Buildroot] [Bug 5726] New: List all the available hook points
Message-ID: <bug-5726-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5726

           Summary: List all the available hook points
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: zinosat at tiscali.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4652
  --> https://bugs.busybox.net/attachment.cgi?id=4652
List all the available hook points

Not all the available hook points are listed in the documentation; in
particular the following were missing:

 LIBFOO_POST_DOWNLOAD_HOOKS
 LIBFOO_POST_EXTRACT_HOOKS
 LIBFOO_PRE_PATCH_HOOKS
 LIBFOO_POST_INSTALL_IMAGES_HOOKS

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
