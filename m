From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Mar 2015 00:03:39 +0000 (UTC)
Subject: [Buildroot] [Bug 7951] New: gcc 4.9.2 fails to build for
 sparc-buildroot-linux-gnu
Message-ID: <bug-7951-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7951

              Host: x86_64
            Target: sparc-buildroot-linux-gnu
           Summary: gcc 4.9.2 fails to build for sparc-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5931
  --> https://bugs.busybox.net/attachment.cgi?id=5931
build log

gcc 4.9.2 fails to build for sparc-buildroot-linux-gnu (buildroot git HEAD as
of today).

In file included from
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:17:0:
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72:
error: size of array ???assertion_failed__865??? is negative
     typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]
                                                                        ^

Full log attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
