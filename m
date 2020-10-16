From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Oct 2020 00:47:11 +0000
Subject: [Buildroot] [Bug 13276] New: libcap builds libcap.pc incorreclty
Message-ID: <bug-13276-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13276

            Bug ID: 13276
           Summary: libcap builds libcap.pc incorreclty
           Product: buildroot
           Version: 2020.05.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: anthonysepa at yahoo.ca
                CC: buildroot at uclibc.org
  Target Milestone: ---

lipcap build also requires lib=lib in the LIBCAP_BUILD_CMDS or it pulls the lib
from the host os. I would suggest removing the lib=lib from the libcap.mk and
adding a patch to fix Make.Rules file instead.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
