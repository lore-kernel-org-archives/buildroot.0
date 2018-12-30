From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 30 Dec 2018 14:41:35 +0800
Subject: [Buildroot] [PATCH 2/2] package/meson: bump to version 0.49.0
In-Reply-To: <1546152095-4439-1-git-send-email-james.hilliard1@gmail.com>
References: <1546152095-4439-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1546152095-4439-2-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This version requires host-python3-setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index a996897..3a5c7dd 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.47.2/meson-0.47.2.tar.gz.asc
-sha256 92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb meson-0.47.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.49.0/meson-0.49.0.tar.gz.asc
+sha256 fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551 meson-0.49.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 1113bf0..5ac9a1d 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.47.2
+MESON_VERSION = 0.49.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.7.4
