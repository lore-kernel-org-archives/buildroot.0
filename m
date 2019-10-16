From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Oct 2019 02:35:22 +0000
Subject: [Buildroot] [Bug 12261] New: sudo versions prior to 1.8.28 are
 affected.
Message-ID: <bug-12261-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12261

            Bug ID: 12261
           Summary: sudo versions prior to 1.8.28 are affected.
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: francisjy_hu at moxa.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

According to sudo.ws, sudo versions prior to 1.8.28 are affected due to
potential bypass of Runas user restrictions.
Please refer to https://www.sudo.ws/alerts/minus_1_uid.html for the detailed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
