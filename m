From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Fri, 23 Apr 2010 11:01:07 +0000
Subject: [Buildroot] uclibc / glibc rfs issues
Message-ID: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I use at91sam9263ek.

I am on BR  latest git. I was trying to duplicate same .config for
uclibc and for , glibc using COdesourcery toolchain.  Both are
building full, but unfortunately I am getting the following for both
toolchains file systems. It waits endlessly without giving login
prompt.

regards

Nataraj

TCP cubic registered
NET: Registered protocol family 17
VFS: Mounted root (jffs2 filesystem) on device 31:0.
Freeing init memory: 136K
g_ether gadget: full speed config #1: CDC Ethernet (ECM)
mount: mounting none on /proc failed: No such file or directory
/bin/sh: can't create /proc/sys/kernel/hotplug: nonexistent directory
mount: can't read /proc/mounts: No such file or directory
mount: mounting proc on /proc failed: No such file or directory
mount: mounting configfs on /config failed: No such device
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists
Starting dropbear sshd: generating rsa key... generating dsa key... OK
