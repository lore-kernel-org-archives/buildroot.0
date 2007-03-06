From: Wang, Baojun <wangbj@lzu.edu.cn>
Date: Tue, 6 Mar 2007 14:31:10 +0800
Subject: [Buildroot] [buildroot 0001248]: Update fakeroot to 1.6.2.
In-Reply-To: <373093324.00411@lzu.edu.cn>
References: <373093324.00411@lzu.edu.cn>
Message-ID: <373223867.11979@eyou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2007 19:10, bugs at busybox.net wrote:
I'm using buildroot snap shot 20070304, not sure whether the problem was fixed 
by now since it's very simple:

diff -Nru fakeroot.orig/fakeroot.mk fakeroot/fakeroot.mk
--- fakeroot.orig/fakeroot.mk   2007-03-04 16:15:09.000000000 +0800
+++ fakeroot/fakeroot.mk        2007-03-06 14:15:29.000000000 +0800
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.5.12
+FAKEROOT_VERSION:=1.6.4
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)

> The following issue has been CLOSED
> ======================================================================
> http://busybox.net/bugs/view.php?id=1248
> ======================================================================
> Reported By:                holin
> Assigned To:                buildroot
> ======================================================================
> Project:                    buildroot
> Issue ID:                   1248
> Category:                   Other
> Reproducibility:            always
> Severity:                   minor
> Priority:                   normal
> Status:                     closed
> Resolution:                 open
> Fixed in Version:
> ======================================================================
> Date Submitted:             03-02-2007 13:02 PST
> Last Modified:              03-05-2007 03:10 PST
> ======================================================================
> Summary:                    Update fakeroot to 1.6.2.
> Description:
> There are already two reports that fakeroot 1.5.12 is removed from the
> debian ftp. Please, update fakeroot to, at least, 1.6.2, since it also
> includes Mac OS X support. Attached a patch to do the update.
>
> ======================================================================
>
> ----------------------------------------------------------------------
>  jacmet - 03-05-07 03:10
> ----------------------------------------------------------------------
> Fixed in r18007.
>
> Issue History
> Date Modified   Username       Field                    Change
> ======================================================================
> 03-02-07 13:02  holin          New Issue
> 03-02-07 13:02  holin          Status                   new => assigned
> 03-02-07 13:02  holin          Assigned To               => buildroot
> 03-02-07 13:02  holin          File Added:
> buildroot-070302-fakeroot-update.patch
> 03-05-07 03:10  jacmet         Status                   assigned => closed
> 03-05-07 03:10  jacmet         Note Added: 0002206
> ======================================================================
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-- 
Wang, Baojun                                        Lanzhou University
Distributed & Embedded System Lab              http://dslab.lzu.edu.cn
School of Information Science and Engeneering        wangbj at lzu.edu.cn
Tianshui South Road 222. Lanzhou 730000                     .P.R.China
Tel:+86-931-8912025                                Fax:+86-931-8912022
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070306/27fa7141/attachment.pgp 
