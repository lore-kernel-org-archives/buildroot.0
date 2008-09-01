From: Steven Woody <narkewoody@gmail.com>
Date: Mon, 1 Sep 2008 16:02:48 +0800
Subject: [Buildroot] Login exited
Message-ID: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The buildroot I am using is the 080831 snapshot. Now I see the boot
prompt finally!  But I can't login:

---
Welcome to uClibc
uClibc login: root
Dec 31 17:01:05 nlmt auth.info login[195]: root login on 'ttyS0'
Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
Dec 31 17:0


Welcome to uClibc
uClibc login: default
Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
Dec 31 17:0
---

And, I got see a suspicious messages just after the kernel booted:

---
VFS: Mounted root (cramfs filesystem) readonly.
Freeing init memory: 84K
Error -3 while decompressing!
c0925384(-7384812)->c3e38000(4096)
---

I think I am so near to success, please help me! Thanks.

-
narke
