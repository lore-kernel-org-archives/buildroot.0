From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 May 2019 04:48:55 +0000
Subject: [Buildroot] [Bug 11841] New: grub-efi.cfg not used when building
 EFI disk image
Message-ID: <bug-11841-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11841

            Bug ID: 11841
           Summary: grub-efi.cfg not used when building EFI disk image
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmorici at dev295.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

In the board/pc directory there is a file grub-efi.cfg that the readme.txt file
says is used when building an EFI based image but it doesn't appear that the
grub configuration from that file is ever used any place.  Instead, the script
post-image-efi-gpt.sh has a grub configuration embedded in it that gets used.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
