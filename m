From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Mar 2020 17:17:56 +0000
Subject: [Buildroot] [Bug 12731] New: rtl8188eu not buildung for banana pi
 M1 (glib, systemd, 4.18.12)
Message-ID: <bug-12731-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12731

            Bug ID: 12731
           Summary: rtl8188eu not buildung for banana pi M1 (glib,
                    systemd, 4.18.12)
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rac at racsoftware.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Version 2020.05-git-00560-gf3adc71b07

Hardware Handling / rtl8188eu, rtl8723bs and rtl8723bu are not building. The
rest of the rtl* drivers are building fine. 

For rtl8188eu I have the compile error in os_dep / os_intfs.c:704:22 - looks
like the wrong structure net_device is used. I use the standard kernel as per
default in bananapi M1 configuration with glib and systemd, gcc 8.x.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
