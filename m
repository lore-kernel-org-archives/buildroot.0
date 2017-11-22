From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Nov 2017 02:58:51 +0000
Subject: [Buildroot] [Bug 10521] New: U-Boot 2017.09 has a bug in fdt set
 command
Message-ID: <bug-10521-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10521

            Bug ID: 10521
           Summary: U-Boot 2017.09 has a bug in fdt set command
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sjr_ee at yahoo.ca
                CC: buildroot at uclibc.org
  Target Milestone: ---

There is a bug in U-Boot 2017.09 in the fdt set command, which prevents it from
being able to add a property to a device tree node. That version is the default
in buildroot-2017.11-rc2. U-Boot 2017.11 is now the current release. I haven't
yet confirmed if the bug is fixed in 2017.11.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
