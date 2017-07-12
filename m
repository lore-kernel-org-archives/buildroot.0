From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 13:11:22 +0000
Subject: [Buildroot] [Bug 10041] New: Qt5base: examples were not installed
Message-ID: <bug-10041-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10041

            Bug ID: 10041
           Summary: Qt5base: examples were not installed
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tuzakli.refik at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am trying to build a qt platform on the imx6dl board.
to check to Qt I want to run example on my device however, I check the
dependencies, it  still does not appear.

BR2_PACKAGE_QT5BASE [=y]
BR2_PACKAGE_QT5BASE_EXAMPLES [=y]
BR2_STATIC_LIBS [=n]

file tree on the device:

# pwd
/usr/lib/qt
# ls
plugins
#

Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
