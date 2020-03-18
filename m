From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Mar 2020 15:16:43 +0000
Subject: [Buildroot] [Bug 12661] New: cups problems in buildroot
Message-ID: <bug-12661-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12661

            Bug ID: 12661
           Summary: cups problems in buildroot
           Product: buildroot
           Version: 2019.11.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: skif at skif-web.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8401
  --> https://bugs.busybox.net/attachment.cgi?id=8401&action=edit
configs and logs

If printing test-page (from cups web-interface), got error "Exception: open no:
No such file or directory" in web-interface 

If printing text-file (fstab for example, lp /etc/fstab), got error "Exception:
open no: No such file or directory" in web-interface.

If printing binary file, (head -n 1 /bin/cp >/1;lp -d test /1) all works fine


Used printer - hp  laserJet pro m402dn
Used driver - generic post-script (work fine fron linux-mint and gentoo)
Used defaconfig - qemu_x86_84_defconfig

-- 
You are receiving this mail because:
You are on the CC list for the bug.
