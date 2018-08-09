From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 09 Aug 2018 21:30:51 +0000
Subject: [Buildroot] [Bug 11211] New: Internal compiler error: Killed
 (program cc1plus) on WebCoreDerivedSources.dir
Message-ID: <bug-11211-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11211

            Bug ID: 11211
           Summary: Internal compiler error: Killed (program cc1plus) on
                    WebCoreDerivedSources.dir
           Product: buildroot
           Version: 2018.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: kdevries at AESAustin.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Attached configuration file.

Buildroot Version is actually 2018.02.04 - no selection under Version to allow
for this particular version.

Performed a 'make clean' before 'make'. Failure occurred about 2 hours into the
build process.

Last breath of build:

_/__/DerivedSources/WebCore/JSSVGFEDropShadowElement.cpp.o
i586-buildroot-linux-gnu-g++.br_real: internal compiler error: Killed (program
cc1plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[4]: ***
[Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/build.make:14493:
Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/JSSVGFEColorMatrixElement.cpp.o]
Error 4
make[4]: *** Deleting file
'Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/JSSVGFEColorMatrixElement.cpp.o'
make[4]: *** Waiting for unfinished jobs....
{standard input}: Assembler messages:
{standard input}:2563: Warning: end of file not at end of a line; newline
inserted
{standard input}: Error: open CFI at the end of file; missing .cfi_endproc
directive
i586-buildroot-linux-gnu-g++.br_real: internal compiler error: Killed (program
cc1plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[4]: ***
[Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/build.make:14469:
Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/JSSVGFEBlendElement.cpp.o]
Error 4
make[4]: Leaving directory
'/share/home/kdevries/esc/8864/buildroot/buildroot-2018.02.4/output/build/webkitgtk-2.18.6'
make[3]: *** [CMakeFiles/Makefile2:1017:
Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/all] Error 2
make[3]: Leaving directory
'/share/home/kdevries/esc/8864/buildroot/buildroot-2018.02.4/output/build/webkitgtk-2.18.6'
make[2]: *** [Makefile:152: all] Error 2
make[2]: Leaving directory
'/share/home/kdevries/esc/8864/buildroot/buildroot-2018.02.4/output/build/webkitgtk-2.18.6'
make[1]: *** [package/pkg-generic.mk:226:
/share/home/kdevries/esc/8864/buildroot/buildroot-2018.02.4/output/build/webkitgtk-2.18.6/.stamp_built]
Error 2
make[1]: Leaving directory
'/share/home/kdevries/esc/8864/buildroot/buildroot-2018.02.4'
make: *** [Makefile:39: buildroot_common] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
