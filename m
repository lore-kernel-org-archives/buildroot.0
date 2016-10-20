From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Oct 2016 09:49:29 +0000
Subject: [Buildroot] [Bug 9371] New: openssl: download failes with "Only
 allow downloads from primary download site" + local server
Message-ID: <bug-9371-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9371

            Bug ID: 9371
           Summary: openssl: download failes with "Only allow downloads
                    from primary download site" + local server
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: johanderycke at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

We have " Only allow downloads from primary download site" enabled and have a
local webserver with all needed packages on it.
For openssl some patches are added to "OPENSSL_PATCH" (eg.
https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d)

Our server has this file available but wget fails because of the "?" in the
name.

Any suggestions on a working workaround?

Best regards,

Johan

-- 
You are receiving this mail because:
You are on the CC list for the bug.
