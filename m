From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 22:28:18 +0200
Subject: [Buildroot] [git commit] package/qwt: bump version to 6.1.3
Message-ID: <20160613203323.6C36681E8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=391bb2a5809845877f4ac4643480983efcc0a6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/qwt.hash | 5 +++--
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index fc78b75..a0077a6 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  2b08f18d1d3970e7c3c6096d850f17aea6b54459389731d3ce715d193e243d0c  qwt-6.1.2.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.1.3/
+sha1 90ec21bc42f7fae270482e1a0df3bc79cb10e5c7  qwt-6.1.3.tar.bz2
+md5  19d1f5fa5e22054d22ee3accc37c54ba          qwt-6.1.3.tar.bz2
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 0bea5f3..da30dd2 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.2
+QWT_VERSION = 6.1.3
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
