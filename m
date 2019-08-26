From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Aug 2019 11:11:55 +0000
Subject: [Buildroot] [Bug 12146] New: Oprofile runtime issue
Message-ID: <bug-12146-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12146

            Bug ID: 12146
           Summary: Oprofile runtime issue
           Product: buildroot
           Version: 2019.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ragaprasanth at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8221
  --> https://bugs.busybox.net/attachment.cgi?id=8221&action=edit
defconfig used for Beaglebone Black + oprofile

Hi,

I tried building oprofile for my Beagle bone Black (cortex-A8), where the build
went fine. But, I could see a runtime issue.

Could any help me with this?

Attached defconfig and pasted the error-log at runtime.

# operf --version
Unexpected error running operf: Operation not supported
#

-- 
You are receiving this mail because:
You are on the CC list for the bug.
