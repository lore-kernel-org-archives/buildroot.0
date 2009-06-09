From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Jun 2009 15:22:03 +0000 (UTC)
Subject: [Buildroot] [Bug 387] New: Tremor not installed to toolchain
Message-ID: <bug-387-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387

              Host: linux
            Target: mipsel-linux
           Summary: Tremor not installed to toolchain
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: evan.zelkowitz at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When selecting tremor usage for vorbis it installs into the root fs properly
but it is not being installed into the toolchain, so everything still gets
built against libvorbis instead of tremor.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
