From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Mar 2019 04:14:04 +0000
Subject: [Buildroot] [Bug 11741] New: pigpio does not build host-pigpio.
Message-ID: <bug-11741-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11741

            Bug ID: 11741
           Summary: pigpio does not build host-pigpio.
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: vishalbhalani89 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

pigpio library was recently added into my project dependency but i realized it
does not install into staging directory means not installed header and lib for
cross compile for other application.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
