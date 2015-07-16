From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:41:03 +0200
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.5.1
Message-ID: <20150716214108.435DE81DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6766f3e442d0396f123e2b67e50fcbd2bcc2d29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.hash |    6 +++---
 package/gettext/gettext.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index 9860792..8d161f6 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-07/msg00004.html
-md5	546a8458f50e146be12c215f83b9bac2	gettext-0.19.5.tar.xz
-sha1	bfe50a885076a24d63b9d9b242a409cc16727d24	gettext-0.19.5.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2015-07/msg00008.html
+md5	9b7c37e410df4bd1bf854e8c897cf937	gettext-0.19.5.1.tar.xz
+sha1	668562227972d2645ac6c5930448ba74df65a53f	gettext-0.19.5.1.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index c9aaa6a..5ef1ac4 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.5
+GETTEXT_VERSION = 0.19.5.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
