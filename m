From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Sep 2016 15:42:33 +0000
Subject: [Buildroot] [Bug 9321] New: Vanilla libcrypt++ v5.6.3 doesn't allow
 to work Nvidia Tegra's flash utility (tegrarcm)
Message-ID: <bug-9321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9321

            Bug ID: 9321
           Summary: Vanilla libcrypt++ v5.6.3 doesn't allow to work Nvidia
                    Tegra's flash utility (tegrarcm)
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: andrey.volkov at nexvision.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6736
  --> https://bugs.busybox.net/attachment.cgi?id=6736&action=edit
Patch to fix this issue

Nvidia Tegra's flash utility 'tegrarcm' from the package 'tegrarcm', demands
fixed libcrypt++ library, or it will failed at wrong assert check. Patches who
fix this (and also others) issue currently presented in the debian libcrypt++
package. So I've imported and converted them to be buildroot friendly. Integral
patch attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
