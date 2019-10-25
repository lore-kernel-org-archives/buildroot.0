From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Oct 2019 12:41:54 +0000
Subject: [Buildroot] [Bug 12286] New: Can't import gobject in python 3.8
Message-ID: <bug-12286-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12286

            Bug ID: 12286
           Summary: Can't import gobject in python 3.8
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: grzegorz at blach.pl
                CC: buildroot at uclibc.org
  Target Milestone: ---

This appears to be a similar problem to libselinux:

>>> import gobject
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
<module>
  File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in
<module>
SystemError: initialization of _glib raised unreported exception

-- 
You are receiving this mail because:
You are on the CC list for the bug.
