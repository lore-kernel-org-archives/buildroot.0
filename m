From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:42:37 +0200
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.0.1
Message-ID: <20140417194447.3E8589C80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97db0593633e491944528ac2306f97626684ee20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnftnl/libnftnl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 0aecf12..1e054b5 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.0
-LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files/
+LIBNFTNL_VERSION = 1.0.1
+LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
 LIBNFTNL_LICENSE_FILES = COPYING
