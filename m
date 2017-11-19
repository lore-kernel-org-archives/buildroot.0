From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Nov 2017 07:38:08 +0000
Subject: [Buildroot] [Bug 10506] New: Changing the kernel image type (e.g.
 zImage to uImage) does not take effect immediately
Message-ID: <bug-10506-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10506

            Bug ID: 10506
           Summary: Changing the kernel image type (e.g. zImage to uImage)
                    does not take effect immediately
           Product: buildroot
           Version: 2017.02.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: gmichael225 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I may be missing something, but when I:

 - complete a build by running "make", then
 - change the kernel image type from zImage from uImage, or from uImage to
zImage, then
 - run "make" again

the newly requested image type is not created.

Running "make clean", before "make" does cause the image to be created (but
obviously that's a lot of recompiling!)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
