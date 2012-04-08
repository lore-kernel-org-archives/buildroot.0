From: Max R. <m.r650200@gmail.com>
Date: Sun, 8 Apr 2012 12:23:32 -0300
Subject: [Buildroot] It is not booting
Message-ID: <CANtrhT1y_E68NqNsLhJ7PiQS75DhjrMvHmF3gDUyMWC_bU45MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm using Buildroot in order to build a minimal linux version to be
used as a test environment. The compilation process worked fine, no
problem occurred  during it. However, the boot process is taking so
long time. I know it is normal to take some time to generate the keys
used by dropbear(sshd), but after generating the keys a message about
hrtimer shows up and nothing happens anymore. What is wrong with my
version?
By the way, qemu is used to boot, the target arch is i386 and
filesystem is ext2.

Thanks in advance.

-- 
Max R.
