From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Sep 2017 21:03:36 +0000
Subject: [Buildroot] [Bug 10341] New: gdb install of py files when using
 buildroot toolchain includes build path
Message-ID: <bug-10341-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10341

            Bug ID: 10341
           Summary: gdb install of py files when using buildroot toolchain
                    includes build path
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

We noticed the build always pulls the path in under
./host/share/gdb/auto-load/* when installing some gdb python files.  Haven't
dug further at this point.

i.e
./host/share/gdb/auto-load/home/johndoe/build_folder/host/lib/*.py

-- 
You are receiving this mail because:
You are on the CC list for the bug.
