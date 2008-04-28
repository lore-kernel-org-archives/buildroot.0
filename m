From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Mon, 28 Apr 2008 10:16:48 +0530 (IST)
Subject: [Buildroot] Buildroot login issue
Message-ID: <261861.27627.qm@web94111.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have compiled a kernel, version linux-2.6.24.4 using the toolchain at http://cross-lfs.org/view/clfs-sysroot/arm/ which is not a uClibc version. Then I have compiled a cpio file system using buildroot which has it own version of uClibc.

When I try to boot these images, I am not able to login. It comes back to the same login prompt when I login as root.

Could the difference in the toolchain versions cause this error?

Output:
....
....
NET: Registered protocol family 1
NET: Registered protocol family 17
registered taskstats version 1
Freeing init memory: 1108K

Welcome to the uClibc development environment.
DPB2440 login: root

Welcome to the uClibc development environment.
DPB2440 login:



Any help would be appreciated.

Thanks in Advance.
Tiju




      Get the freedom to save as many mails as you wish. To know how, go to http://help.yahoo.com/l/in/yahoo/mail/yahoomail/tools/tools-08.html
