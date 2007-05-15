From: Brian Austin <brian.austin@cirrus.com>
Date: Tue, 15 May 2007 06:15:41 -0500
Subject: [Buildroot] EABI toolchains do not free init in busybox
Message-ID: <1179227741.17486.52.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been building gcc-4.1.1, 4.1.2, 4.2 toolchains for ARM9 EABI with
2.6.20.4 kernel headers from buildroot. I am using daily snapshots of
uClibc as well.

I have tried busybox 1.2.0, 1.4.1, and 1.5.0,  same results.

the files are built in EABI format as well

they build fine and compile all lf my code and generate a ramdisk.

kernel boots, but init does not let go and bring me to a shell.

Has anyone had any success with building EABI toolchains for ARM9 from
buildroot?

I can post my uclibc and buildroot configs if needed.

Thanks,

Brian
