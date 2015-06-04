From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 15:34:01 +0200
Subject: [Buildroot] [git commit] gnupg2: bump to version 2.0.28
Message-ID: <20150604133645.F17C381E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90687cc72aa439e17484442ba372ae08932617bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash |    4 ++--
 package/gnupg2/gnupg2.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 404c40b..2a2305c 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000362.html
-sha1	d065be185f5bac8ea07b210ab7756e79b83b63d4	gnupg-2.0.27.tar.bz2
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q2/000367.html
+sha1	9a1050f72b6c9afe2b4a0a3f2e9dca2abba8e4ef	gnupg-2.0.28.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index aa35c36..ab3a59a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.27
+GNUPG2_VERSION = 2.0.28
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
