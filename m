From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Wed, 16 Apr 2008 17:39:37 +0530 (IST)
Subject: [Buildroot] uclibc_login_s3c2440
Message-ID: <501544.71316.qm@web94103.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have used buildroot to build a cpio filesystem for s3c2440A processor.

I build
the whole buildroot. Do we have to make the changes only
in"target/generic/device_table.txt" and "etc/inittab" to enable
ttySAC0? Do we have to modify "/etc/securetty" to have root permissions?
If so,I tried modifying it and added ttySAC0. But still it comes back
to thesame login.
Output is as follows:
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

What could be the problem? Someone please help ! ! !

Thanks in Advance.
Tiju



      Bring your gang together. Do your thing. Find your favourite Yahoo! group at http://in.promos.yahoo.com/groups/
