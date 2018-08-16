From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Aug 2018 14:40:19 +0000
Subject: [Buildroot] [Bug 11236] New: util-linux fails to build on Travis CI
 when python also selected
Message-ID: <bug-11236-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11236

            Bug ID: 11236
           Summary: util-linux fails to build on Travis CI when python
                    also selected
           Product: buildroot
           Version: 2018.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frankv at helium.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Here is a link to the build output.  Notice that Python.h cannot be located.

https://gist.github.com/fvasquez/1d4e94b37bd3388a3e6051d03d25fbd2

The failure only occurs when building on Travis CI.  The same defconfig builds
just fine on my Ubuntu 16.04 laptop.  I tried adding python-dev to apt packages
in .travis.yml to no avail.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
