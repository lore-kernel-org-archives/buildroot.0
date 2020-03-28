From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Mar 2020 18:06:05 +0000
Subject: [Buildroot] [Bug 12716] New: bio.h not found
Message-ID: <bug-12716-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12716

            Bug ID: 12716
           Summary: bio.h not found
           Product: buildroot
           Version: 2020.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: fshah48 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8416
  --> https://bugs.busybox.net/attachment.cgi?id=8416&action=edit
Output of make and stderr + output of find -name bio.h

I am rather new to linux.
Tried to build default configuration with minor changes required to produce ISO
image for running under qemu. I could update .config but it is 90KB and
restriction is 75KB.

<make menuconfig> failed because it could not find bio.h
I captured output of next attempt since it would produce only related output.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
