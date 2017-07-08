From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Jul 2017 01:50:31 +0000
Subject: [Buildroot] [Bug 10011] New: wget does not work from Buildroot
Message-ID: <bug-10011-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10011

            Bug ID: 10011
           Summary: wget does not work from Buildroot
           Product: buildroot
           Version: 2017.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ptomov at mirion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

During a make of a Raspbian image Buidroot reported error:

"Resolving downloads.uclibc-ng.org (downloads.uclibc-ng.org)... failed:
Temporary failure in name resolution.
...
package/pkg-generic.mk:139: recipe for target
'/home/ptomov/buildroot/output/build/uclibc-1.0.25/.stamp_downloaded' failed
..."
and exited with 2 errors.

I verified that I could sucesssfully run from command line:

$wget https://www.uclibc-ng.org/ 

Please advise me how to solve this problem.

Thanks,

  Paul

-- 
You are receiving this mail because:
You are on the CC list for the bug.
