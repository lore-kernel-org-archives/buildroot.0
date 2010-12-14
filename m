From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 14 Dec 2010 17:56:06 +0200
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <20101214163754.6b1e664f@surf>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
	<20101214160558.325cddcb@surf>
	<AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
	<20101214163754.6b1e664f@surf>
Message-ID: <AANLkTik3m_kFJjxqo-Y3XS0J+AjbhPfXQ3CiSXvVOs6n@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

!@Z#!@Z$%!@%!@

Just for google referene: I am booting from NFS, and this is what I see on
the device:

/ # cat /etc/shadow
cat: read error: Input/output error

On my desktop:
diego at diego-linux# ls -l /home/diego/rootfs-new/etc/shadow
-rw------- 1 root root 321 2010-10-10 11:33
/home/diego/rootfs-new/etc/shadow
diego at diego-linux# sudo chmod a+r /home/diego/rootfs-new/etc/shadow
[sudo] password for diego:
.......

And now it works. The problem is that shadow was not readable from the
remote NFS.  Now I wait for the correct fix for this problem.

DO NOT FOLLOW THIS ADVISE ON PRODUCTION ENVIRONMENTS AS THIS IS A HUGE
SECURITY HOLE.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/d08bedeb/attachment.html>
