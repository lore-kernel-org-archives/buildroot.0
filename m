From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 May 2019 21:45:41 +0000
Subject: [Buildroot] [Bug 11921] New: dahdi fails to build
Message-ID: <bug-11921-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11921

            Bug ID: 11921
           Summary: dahdi fails to build
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: zinosat at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8066
  --> https://bugs.busybox.net/attachment.cgi?id=8066&action=edit
Dahdi build failure log

I've successfully built a minimal image using "pc_x86_64_bios_defconfig" where
I added "asterisk" package to the selections: my buildroot repo is set to
2019.05-rc3

I've then selected "dhadi-linux" and "dahdi-tools": run make again and got a
failure. Details on the attached log.

regards,
Davide

-- 
You are receiving this mail because:
You are on the CC list for the bug.
