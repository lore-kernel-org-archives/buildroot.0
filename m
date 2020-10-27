From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Oct 2020 05:56:48 +0000
Subject: [Buildroot] [Bug 13286] New: The system hangs in vmware workstation
 on the line clocksource switched to clocksource tsc
Message-ID: <bug-13286-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13286

            Bug ID: 13286
           Summary: The system hangs in vmware workstation on the line
                    clocksource switched to clocksource tsc
           Product: buildroot
           Version: 2020.02.7
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: batman82 at list.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Build a system with default parameters for the platform x86.
Made img and iso images.

If run iso in the vmware workstation 15-16 everything is working.
If rub img in the vmware workstation 15-16 system hangs on the line
"clocksource: switched to clocksource tsc"

In the virtualbox no such problem.

See screenshots here https://yadi.sk/d/vucprOsF5M0tDQ?w=1

How to fix?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
