From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 May 2021 13:12:26 +0000
Subject: [Buildroot] [Bug 13796] New: Problems compiling package
 gst-plugins-good
Message-ID: <bug-13796-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13796

            Bug ID: 13796
           Summary: Problems compiling package gst-plugins-good
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alfredo.pons at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8936
  --> https://bugs.busybox.net/attachment.cgi?id=8936&action=edit
Configuration file and logs

With my configuration for Raspberry Pi 1, the compilation of gst-plugins-good
fails. I attach configuration file and compilation logs (extract).

To reproduce the compilation error, just load my configuration and run: 'make'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
