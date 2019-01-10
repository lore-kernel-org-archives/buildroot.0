From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Jan 2019 17:33:41 +0000
Subject: [Buildroot] [Bug 11606] New: libjpeg has no Config.in
Message-ID: <bug-11606-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11606

            Bug ID: 11606
           Summary: libjpeg has no Config.in
           Product: buildroot
           Version: 2018.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tapio.tallgren at nokia.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The package libjpeg has no Config.in file. This causes problems when another
package depends on libjpeg

-- 
You are receiving this mail because:
You are on the CC list for the bug.
