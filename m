From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 21:08:52 +0200
Subject: [Buildroot] [git commit] libtasn1: bump to version 4.2
Message-ID: <20140916201651.7CF9A9D6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f300a27ed8a770160606e883fd01bd56ea8dfad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 45fff87..bccbdf3 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.1
+LIBTASN1_VERSION = 4.2
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
