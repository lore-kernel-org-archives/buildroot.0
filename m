From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2020 10:29:59 +0000
Subject: [Buildroot] [Bug 12811] New: bootstrap stuck and no login prompt
Message-ID: <bug-12811-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12811

            Bug ID: 12811
           Summary: bootstrap stuck and no login prompt
           Product: buildroot
           Version: 2020.02.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: cristovao.cordeiro at sixsq.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi guys,

Setup: RPi 3 B+


with 2020.02.1, I've simply `make raspberrypi3_defconfig`, `make menuconfig` -
here I've just done some basic stuff like: use glibc, use systemd init,
increase the fs image size, and installed docker-cli, docker-engine and
open-ssh. Then `make`


Config: https://pastebin.com/q2qx4wNq


when booting my RPi 3B+, the last message on the splash screen is "IPv6:
ADDRCONF(NETDEV_UP): docker0: link is not read", and I cannot move from there. 

there's no login prompt
and if I try to SSH remotely, it asks for password...even though I've left it
default (should be none)


Any ideas?
Thanks in advance

-- 
You are receiving this mail because:
You are on the CC list for the bug.
