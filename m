From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Mar 2020 12:33:51 +0000
Subject: [Buildroot] [Bug 12681] New: Mongodb fails to build from sources
Message-ID: <bug-12681-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12681

            Bug ID: 12681
           Summary: Mongodb fails to build from sources
           Product: buildroot
           Version: 2020.02
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

my defconfig is based on pc_x86_64_bios_defconfig
I got failures both in br 2020.2 and 2019.11.1. 

it works in 2019.05

I'm trying to revert mongodb and dependencies to the 2019.05 situation: no luck
so far

revert 2c938815d79d9f351512595a0a67ad25f6f3151d python-yaml
revert 68dd5ab1affe95bc031f2a2a66317ba9244a1941 yaml-cpp
revert 5a82a984b5c9d28fa62a3783bcc90b3addab21a4 scons
revert 165e9c163c4d28025a5e1d3e5e6cfd0ad6476a7e mongodb

error log available here:
https://pastebin.com/vRPKixBy

-- 
You are receiving this mail because:
You are on the CC list for the bug.
