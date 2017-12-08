From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Dec 2017 10:59:39 +0000
Subject: [Buildroot] [Bug 10561] New: OpenZwave generates
 libopenzwave.so.1.4 instead of libopenzwave.so.1.5
Message-ID: <bug-10561-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10561

            Bug ID: 10561
           Summary: OpenZwave generates libopenzwave.so.1.4 instead of
                    libopenzwave.so.1.5
           Product: buildroot
           Version: 2017.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: laibulle at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello, 

I am a new user of BuildRoot. I am trying to use OpenZwave 1.5 on raspberry Pi
3, I have fetched buildroot-2017.02.8.tar.gz but the generated lib is version
1.4 but the content of is package/openzwave/openzwave.mk is

OPENZWAVE_VERSION = V1.5
OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
        license/gpl.txt license/Apache-License-2.0.txt


Am doing something wrong ?

Best regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
