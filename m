From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jul 2019 21:01:17 +0000
Subject: [Buildroot] [Bug 12051] New: Build succeeds but leaves a temporary
 libtool wrapper script for dhcp in the rootfs
Message-ID: <bug-12051-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12051

            Bug ID: 12051
              Host: i386
             Build: amd64
           Summary: Build succeeds but leaves a temporary libtool wrapper
                    script for dhcp in the rootfs
           Product: buildroot
           Version: 2019.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Keywords: link-failure
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jakobcornell at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

It's all in the title. Make proceeds to completion, but the dhcp build doesn't
finish.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
