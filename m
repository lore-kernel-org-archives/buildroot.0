From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Dec 2019 02:23:49 +0000
Subject: [Buildroot] [Bug 12386] New: carriage return issue when "make
 menuconfig"
Message-ID: <bug-12386-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12386

            Bug ID: 12386
           Summary: carriage return issue when "make menuconfig"
           Product: buildroot
           Version: 2019.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lida_mail at 163.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8301
  --> https://bugs.busybox.net/attachment.cgi?id=8301&action=edit
build log

It seems that script file include "carriage return".
I can't build image's on linux environment.

Following branches has been checked.

* 2018.08.x
  2018.11.x
  2019.02.x
  2019.05.x
  2019.08.x
  2019.11.x
  master     --> git 17638bc3ada60c7cedc71f4a546c7b75fae6113e

-- 
You are receiving this mail because:
You are on the CC list for the bug.
