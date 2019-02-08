From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Feb 2019 15:36:04 +0000
Subject: [Buildroot] [Bug 11671] New: russian locale ru_RU:145: LC_TIME:
 syntax error
Message-ID: <bug-11671-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11671

            Bug ID: 11671
           Summary: russian locale  ru_RU:145: LC_TIME: syntax error
           Product: buildroot
           Version: 2018.11.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: skif at skif-web.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello!
I m need to build system with russian locale.

BR2_GENERATE_LOCALE="ru_RU"
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_SYSTEM_ENABLE_NLS=y


But i have error:
Generating locale ru_RU.UTF-8
/home/alexey/dev/ktl/ramdisk/output/host/x86_64-buildroot1-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:121:
LC_TIME: syntax error
/home/alexey/dev/ktl/ramdisk/output/host/x86_64-buildroot1-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:145:
LC_TIME: syntax error
no output file produced because warnings were issued
make[1]: *** [Makefile:720: target-finalize] Error 4
make: *** [Makefile:84: _all] Error 2


What's i am doing wrong ang how to fix this error?r?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
