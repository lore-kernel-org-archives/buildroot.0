From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 Jun 2016 14:56:20 +0000
Subject: [Buildroot] [Bug 8971] New: build for beaglebone fails
Message-ID: <bug-8971-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8971

            Bug ID: 8971
           Summary: build for beaglebone fails
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: craigswank at fastmail.fm
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6446
  --> https://bugs.busybox.net/attachment.cgi?id=6446&action=edit
build output

The build fails when I do:

  $ make beaglebone_defconfig
  $ make

I've attached the entire output of the make command.

I'm building on ubuntu 

?  buildroot git:(aa6fd11) ? uname -a
Linux sigatoka 3.19.0-49-generic #55-Ubuntu SMP Fri Jan 22 02:10:24 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux
?  buildroot git:(aa6fd11) ? lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 15.04
Release:        15.04
Codename:       vivid

If anyone needs more info please ask, I can't think of anything else right now.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
