From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Jul 2020 09:14:44 +0000
Subject: [Buildroot] [Bug 13111] New: python-gunicorn: missing dependency on
 python-setuptools
Message-ID: <bug-13111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13111

            Bug ID: 13111
           Summary: python-gunicorn: missing dependency on
                    python-setuptools
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at hschendel.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

gunicorn does not start if package python-setuptools is not installed.
Adding a select BR2_PACKAGE_PYTHON_SETUPTOOLS fixes this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
