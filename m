From: Ashok Shankar Das <ashok.s.das@gmail.com>
Date: Sat, 30 Sep 2006 23:14:24 +0530
Subject: [Buildroot] Networking apps not working
Message-ID: <8032e0b00609301044s489c6efboc8754ce5309a6a9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am new to uclibc. I downloaded the buildroot,uclibc, then made a
rootfilesystem, installed it on a PC. It boots fine even Xorg 6.8.2
with gtk2.0 is installed.
My problem is I am unable to use any networking applications. as an
example ping, mtr etc.
Even if they are compiled properly under the uclibc toolchain they
don't work as desired.
If i give "ping 192.168.0.20" it works but if i give "ping
www.google.com" it never works.
It throws a error message "Un-reachable network"
Where is the "/etc/resolve.conf" shows the proper DNS server ip address.

The llinks which is compiled ok also gives error "Un-reachable network"

Where i am going wrong?

PLease help me.

-- 
Thanks
Ashok.
-------------
