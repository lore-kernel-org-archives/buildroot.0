From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Jun 2021 09:07:33 +0000
Subject: [Buildroot] [Bug 13831] New: mesa3d - kmsro driver requires dri3
Message-ID: <bug-13831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13831

            Bug ID: 13831
           Summary: mesa3d - kmsro driver requires dri3
           Product: buildroot
           Version: 2021.05
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: gamelaster at outlook.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Package: mesa3d
At the moment, Gallium kmsro driver supports only dri3, but since dri3 flag is
added only when BR2_PACKAGE_MESA3D_DRI_DRIVER or
BR2_PACKAGE_MESA3D_VULKAN_DRIVER is enabled, dri3 is not enabled in mesa, thus
kmsro and lima drivers are not working. (panfrost should be affected too).

More information about this issue are here:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/4861

Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
