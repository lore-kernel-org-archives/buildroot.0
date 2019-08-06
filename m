From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 06 Aug 2019 00:58:13 +0000
Subject: [Buildroot] [Bug 12086] New: dhcp shared libraries not installed to
 target
Message-ID: <bug-12086-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12086

            Bug ID: 12086
             Build: i386
           Summary: dhcp shared libraries not installed to target
           Product: buildroot
           Version: 2019.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jakobcornell at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8191
  --> https://bugs.busybox.net/attachment.cgi?id=8191&action=edit
Buildroot config

Some shared libraries for the dhcp package aren't installed to the target.

In my particular case, most are included, but 'libdhcp', 'libomapi', and
'libdhcpctl' are missing.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
