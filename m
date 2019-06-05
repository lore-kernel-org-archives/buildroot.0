From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Jun 2019 07:35:31 +0000
Subject: [Buildroot] [Bug 11936] New: libcpprestsdk should install to staging
Message-ID: <bug-11936-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11936

            Bug ID: 11936
           Summary: libcpprestsdk should install to staging
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: hein at gustavsen.cc
                CC: buildroot at uclibc.org
  Target Milestone: ---

The libcpprestsdk should install to staging for other packages to find it. I
tried to add the azure-storage-cpp package version 6.0.0 which requires
libcpprestsdk 2.10.10 and it does not find libcpprestsdk unless it is installed
in staging.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
