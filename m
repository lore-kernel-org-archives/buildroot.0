From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 22:09:59 +0000
Subject: [Buildroot] [Bug 8746] New: At startup system stops with 'cannot
 set terminal process group (-1): Inappropriate ioctl for device' error
Message-ID: <bug-8746-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8746

            Bug ID: 8746
           Summary: At startup system stops with 'cannot set terminal
                    process group (-1): Inappropriate ioctl for device'
                    error
           Product: buildroot
           Version: 2015.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rdbirt at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

After updating from buildroot 2015.02 I am seeing this error on system startup:

.
.
.
EXT4-fs (mmcblk0p1): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) on device 179:1.
devtmpfs: mounted
Freeing unused kernel memory: 228K (c07db000 - c0814000)
sh: cannot set terminal process group (-1): Inappropriate ioctl for device
sh: no job control in this shell
sh-4.3# 

The same error occurs with 2016.02-rc2.  I am running this on a Wandboard quad
with kernel 3.18.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
