From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 02 May 2020 02:52:42 +0000
Subject: [Buildroot] [Bug 12831] New: RPI-firmware package: DTB-overlay
 dependency
Message-ID: <bug-12831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12831

            Bug ID: 12831
           Summary: RPI-firmware package: DTB-overlay dependency
           Product: buildroot
           Version: 2020.02.1
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: melanie at trash-mail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The config option 'BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS' currently
depends on 'BR2_LINUX_KERNEL_DTS_SUPPORT'.

In my opinion this dependency should be changed from
'BR2_LINUX_KERNEL_DTS_SUPPORT' to 'BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT'.

This change would make sure that the DTB-overlays are downloaded/installed only
if DTB-overlay support has been selected for the target system.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
