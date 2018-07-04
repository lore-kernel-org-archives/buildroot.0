From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Jul 2018 14:29:44 +0000
Subject: [Buildroot] [Bug 11141] New: WF111 package no longer availabe
Message-ID: <bug-11141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11141

            Bug ID: 11141
           Summary: WF111 package no longer availabe
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: geert at my-clay.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The current WF111 version is 5-2-2-r3. It is no longer available on the
download website. And therefore builds that rely on it are broken.

The latest WF111 version is 5-2-2-r4 and contains a fix for KRACK exploit and
requires a patched WPA_SUPPLICANT version 2.6. The latest version is available.

This package is available for public download from the URL as specified in the
WF111 make file.

This issue applies to buildroot version 2018.02 and newer, since the download
URL was introduced there.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
