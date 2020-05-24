From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 May 2020 04:29:25 +0000
Subject: [Buildroot] [Bug 12941] New: Python GObject fails to build when
 using BR2_PER_PACKAGE_DIRECTORIES
Message-ID: <bug-12941-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12941

            Bug ID: 12941
           Summary: Python GObject fails to build when using
                    BR2_PER_PACKAGE_DIRECTORIES
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When using the new BR2_PER_PACKAGE_DIRECTORIES setting, Python GObject fails to
build.

Tested with 202005-rc2

../buildroot-4/build/python-gobject-3.36.0/meson.build:16:0: ERROR:
<ExternalProgram 'python3' ->
['/home/matuschd/buildroot-4/per-package/python-gobject/host/bin/python3']> is
not a valid python or it is missing setuptools

-- 
You are receiving this mail because:
You are on the CC list for the bug.
