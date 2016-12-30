From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 14:46:34 +0000
Subject: [Buildroot] [Bug 9546] New: seems
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS do nothing
Message-ID: <bug-9546-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9546

            Bug ID: 9546
           Summary: seems BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS do
                    nothing
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: a.synytsyn at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Enabling  BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS from  Target Packages
-> Hardware Handling -> Firmware does not copy *.dtbo files into boot/overlays
folder.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
