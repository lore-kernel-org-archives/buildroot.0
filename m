From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Oct 2014 16:52:41 +0200
Subject: [Buildroot] [PATCH 6/6] tar: bump to version 1.28
In-Reply-To: <1413284044-20381-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 14 Oct 2014 07:54:04 -0300")
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
 <1413284044-20381-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnper9dy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also add hash file.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/tar/tar-0001-fix-build-failure.patch | 47 ++++++++++++++++++++++++++++
 >  package/tar/tar.hash                         |  2 ++
 >  package/tar/tar.mk                           |  2 +-
 >  3 files changed, 50 insertions(+), 1 deletion(-)
 >  create mode 100644 package/tar/tar-0001-fix-build-failure.patch
 >  create mode 100644 package/tar/tar.hash

 > diff --git a/package/tar/tar-0001-fix-build-failure.patch b/package/tar/tar-0001-fix-build-failure.patch
 > new file mode 100644
 > index 0000000..62bdb3d
 > --- /dev/null
 > +++ b/package/tar/tar-0001-fix-build-failure.patch
 > @@ -0,0 +1,47 @@
 > +From e9ddc08da0982f36581ae5a8c7763453ff41cfe8 Mon Sep 17 00:00:00 2001
 > +From: Sergey Poznyakoff <gray@gnu.org>
 > +Date: Wed, 24 Sep 2014 21:22:16 +0000
 > +Subject: Bugfixes.
 > +
 > +* doc/tar.1: Fix typo in font spec.
 > +* src/tar.c (sort_mode_arg, sort_mode_flag): Protect "inode"
 > +(SAVEDIR_SORT_INODE) with D_INO_IN_DIRENT

Please add S-O-B and note where it comes from exactly (upstream
presumably?)

-- 
Bye, Peter Korsgaard
