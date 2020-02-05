From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Feb 2020 19:09:09 +0000
Subject: [Buildroot] [Bug 12546] New: Ninja 1.10 build Error
Message-ID: <bug-12546-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12546

            Bug ID: 12546
           Summary: Ninja 1.10 build Error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: damian.tometzki at familie-tometzki.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

i got with the actual buildroot git master the following error in step 
building ninja 1.10:

Make Error at CMakeLists.txt:124 (target_link_libraries):
  Target "libninja-re2c" of type OBJECT_LIBRARY may not be linked into
  another target.  One may link only to INTERFACE, STATIC or SHARED
  libraries, or to executables with the ENABLE_EXPORTS property set.


CMake Error at CMakeLists.txt:124 (target_link_libraries):
  Target "libninja" of type OBJECT_LIBRARY may not be linked into another
  target.  One may link only to INTERFACE, STATIC or SHARED libraries, or to
  executables with the ENABLE_EXPORTS property set.


CMake Error at CMakeLists.txt:124 (target_link_libraries):
  Target "libninja-re2c" of type OBJECT_LIBRARY may not be linked into
  another target.  One may link only to INTERFACE, STATIC or SHARED
  libraries, or to executables with the ENABLE_EXPORTS property set.

Best regards
Damian

-- 
You are receiving this mail because:
You are on the CC list for the bug.
