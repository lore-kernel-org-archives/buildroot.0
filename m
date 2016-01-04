From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jan 2016 17:10:58 +0000
Subject: [Buildroot] [Bug 8581] New: pciutils.mk PCIUTILS_MAKE_OPTS typo
Message-ID: <bug-8581-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8581

            Bug ID: 8581
           Summary: pciutils.mk PCIUTILS_MAKE_OPTS typo
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lonnie at abelbeck.com
                CC: buildroot at uclibc.org

For package pciutils, when specifying PCIUTILS_MAKE_OPTS values, there is a
typo:

package/pciutils/pciutils.mk
line 20:
---
-    PCIUTILS_DNS=no
+    DNS=no
---

-- 
You are receiving this mail because:
You are on the CC list for the bug.
