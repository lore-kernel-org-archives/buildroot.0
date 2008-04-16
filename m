From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Wed, 16 Apr 2008 13:03:20 +0530 (IST)
Subject: [Buildroot] Mount_filesystem_s3c2440
Message-ID: <166721.72830.qm@web94109.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> then you have messed up somewhere in between. a standard working 
> buildroot config defaults to this login.
> maybe your system tries to use a non-working shadow file or your 
> password files are crunched somehow.


I build the whole buildroot again. Do we have to make the changes only in "target/generic/device_table.txt" and "etc/inittab" to enable ttySAC0? Do we have to modify "/etc/securetty" to have root permissions? If so, I tried modifying it and added ttySAC0. But still it comes back to the same login.

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

Someone please help ! ! !

Thanks in Advance.
Tiju



      Check out the all-new face of Yahoo! India. Go to http://in.yahoo.com/
