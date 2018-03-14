From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Mar 2018 02:00:39 +0000
Subject: [Buildroot] [Bug 10851] New: Patch to handle numpad Enter key
 properly
Message-ID: <bug-10851-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10851

            Bug ID: 10851
           Summary: Patch to handle numpad Enter key properly
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: igor.liferenko at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7506
  --> https://bugs.busybox.net/attachment.cgi?id=7506&action=edit
Patch to handle KEY_ENTER

Hello,

Numpad Enter key is not recognized in application mode.

Please consider applying the attached patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
