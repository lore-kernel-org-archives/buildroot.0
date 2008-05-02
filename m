From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Fri, 2 May 2008 13:05:23 +0530 (IST)
Subject: [Buildroot] Cannot login a shell
Message-ID: <96471.16332.qm@web94105.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

I have compiled a kernel, version linux-2.6.24.4 using the toolchain at http://cross-lfs.org/view/clfs-sysroot/arm/ which is not a uClibc version. Then I have compiled a cpio file system using buildroot which has it own version of uClibc.

When I try to boot these images, I am not able to login. It comes back to the same login prompt when I login as root.

Output:
....
....
NET: Registered protocol family 1
NET: Registered protocol family 17
registered taskstats version 1
Freeing init memory: 1108K

Welcome to the Erik's uClibc development environment.
uClibc login: root

Welcome to the Erik's uClibc development environment..
uClibc login:



Ihave tried compiling with different versions but it remains the same.It actually spawns a shell, but it comes back to the login. It is thesame with busybox as well as bash.

Kindly help me.

Thanks in Advance.
Tiju



      Meet people who discuss and share your passions. Go to http://in.promos.yahoo.com/groups/bestofyahoo/
