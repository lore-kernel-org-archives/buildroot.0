From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Oct 2019 16:50:48 +0000
Subject: [Buildroot] [Bug 12276] New: make clean/distclean does not remove
 BR2_DL_DIR and BR2_HOST_DIR
Message-ID: <bug-12276-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12276

            Bug ID: 12276
           Summary: make clean/distclean does not remove BR2_DL_DIR and
                    BR2_HOST_DIR
           Product: buildroot
           Version: 2019.08.1
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: br-max at re-gister.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

If the buildroot configuration has a custom BR2_DL_DIR and/or BR2_HOST_DIR (in
my case it points to a path outside of the buildroot tree), then the 'make
clean' and 'make distclean' commands do not remove the content of these
directories.

Is it a bug or normal behaviour that custom download and host directories are
excluded from the cleanup?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
