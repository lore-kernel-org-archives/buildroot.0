From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:11:28 +0100
Subject: [Buildroot] [git commit] vala: bump to version 0.34.4
Message-ID: <20161209171846.4042980102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68e5afb1e1c9f3e77cad437d94e2cb6e8f41c4eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index b5abcc3..ca5873c 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.3.sha256sum
-sha256 f0fad71aca03cdeadf749ca47f56296a4ddd1a25f4e2f09f0ff9e1e3afbcac3f  vala-0.34.3.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.4.sha256sum
+sha256 6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83  vala-0.34.4.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 6eaa7c4..dadfdfc 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).3
+VALA_VERSION = $(VALA_VERSION_MAJOR).4
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
