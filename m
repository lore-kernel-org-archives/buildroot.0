From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Thu, 5 Jul 2007 20:46:29 +0700
Subject: [Buildroot] upgrade findutils version
Message-ID: <5d75f4610707050646x56e0fc92r8cef872eb04e5e8f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is against subversion version 19002

--- buildroot.19002/package/findutils/findutils.mk      2007-07-04
23:02:15.000000000 +0700
+++ buildroot/package/findutils/findutils.mk    2007-07-05
20:42:26.000000000 +0700
@@ -3,7 +3,7 @@
 # findutils
 #
 #############################################################
-FINDUTILS_VER:=4.2.27
+FINDUTILS_VER:=4.2.31
 FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VER).tar.gz
 #FINDUTILS_SITE:=ftp://alpha.gnu.org/gnu/findutils
 FINDUTILS_SITE:=http://ftp.gnu.org/pub/gnu/findutils/
