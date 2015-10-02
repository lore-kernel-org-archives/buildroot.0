From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:52:29 +0200
Subject: [Buildroot] [git commit] smartmontools: bump to version 6.4
Message-ID: <20151002195300.810A081DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=515a6c0fbd13d9ded910e1310a8594a0be313671
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smartmontools/smartmontools.hash |    5 +++--
 package/smartmontools/smartmontools.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index 5a80691..bbaa6dd 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  a777065d1a5965d71b3672e054b09b7696200ec73aaf45ab636f34016538fe19  smartmontools-6.3.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.4/
+md5	56812c8312fd123ed40ef65afde1049e	smartmontools-6.4.tar.gz
+sha1	855c7d555dd405e5b392b1631dc36dd9632db8b8	smartmontools-6.4.tar.gz
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 7c97a21..6d0a82b 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 6.3
+SMARTMONTOOLS_VERSION = 6.4
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
