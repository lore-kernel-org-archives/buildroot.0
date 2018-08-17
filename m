From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2018 17:59:48 +0000
Subject: [Buildroot] [Bug 11241] New: ACPID shouldn't depend on BR2_x86_64
 || BR2_i386
Message-ID: <bug-11241-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11241

            Bug ID: 11241
           Summary: ACPID shouldn't depend on BR2_x86_64 || BR2_i386
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: happycorsair at yandex.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Nowadays multiple ARM-based devboards provide ACPI, so this restriction is not
a good option anymore. For example I've used standard Buildroot acpi package on
Cubieboard 6 without any issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
