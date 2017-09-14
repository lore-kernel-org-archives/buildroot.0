From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Sep 2017 11:32:24 +0000
Subject: [Buildroot] [Bug 10316] New: Building grub fails on debian stretch
Message-ID: <bug-10316-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10316

            Bug ID: 10316
           Summary: Building grub fails on debian stretch
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dde at innovaphone.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Debian stretch comes with binutils 2.28 but with this version of binutils, the
grub build fails in the configure stage, stating that objcopy can't be used due
to incompatible binutils.

There is already a debian patch objcopy-absolute.patch for this issue,
contained here:
http://cdn-fastly.deb.debian.org/debian/pool/main/g/grub/grub_0.97-72.debian.tar.xz

If this patch is included, the build should work again.

I found this info here: https://patchwork.ozlabs.org/patch/783135/

Greetings,
Daniel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
