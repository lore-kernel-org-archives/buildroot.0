From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Aug 2017 20:20:50 +0000
Subject: [Buildroot] [Bug 10206] New:
 buildroot-2017.08-rc1/support/kconfig/confdata.c: couple of minor tweeks
Message-ID: <bug-10206-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10206

            Bug ID: 10206
           Summary: buildroot-2017.08-rc1/support/kconfig/confdata.c:
                    couple of minor tweeks
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcb314 at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

buildroot-2017.08-rc1/support/kconfig/confdata.c:853]: (error) Memory leak:
opwd
[buildroot-2017.08-rc1/support/kconfig/confdata.c:63]: (error) va_list 'ap' was
opened but not closed by va_end().

-- 
You are receiving this mail because:
You are on the CC list for the bug.
