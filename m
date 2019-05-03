From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 14:43:33 +0000
Subject: [Buildroot] [Bug 11836] New: Embedded Shell Scripts in BusyBox
Message-ID: <bug-11836-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11836

            Bug ID: 11836
           Summary: Embedded Shell Scripts in BusyBox
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: br-max at re-gister.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

BusyBox has the feature to embed custom shell scripts into the main binary
during the build process.
Details are described at the following link:
https://git.busybox.net/busybox/tree/docs/embedded-scripts.txt

If the BusyBox config FEATURE_SH_EMBEDDED_SCRIPTS is set to yes (which is the
default setting), all scripts from the 'embed' directory of the BusyBox build
folder are compressed and embedded in the BusyBox binary.

It would be great to be able to use this feature with buildroot, but (please
correct me if I'm wrong) unfortunately there is no configuration option in
buildroot to add custom scripts to the 'embed' directory of the BusyBox build
folder.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
