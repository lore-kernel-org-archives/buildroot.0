From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Apr 2016 22:46:53 +0200
Subject: [Buildroot] [PATCH 3/4] package/elementary: bump to 1.17.0
In-Reply-To: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1461790014-17051-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/elementary/elementary.hash | 4 ++--
 package/elementary/elementary.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elementary/elementary.hash b/package/elementary/elementary.hash
index ecdbc8e..cc8d886 100644
--- a/package/elementary/elementary.hash
+++ b/package/elementary/elementary.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.3.tar.xz.sha256
-sha256	474a9175061021ce8cbcfdbde6162316fc0d927b21118d1ab549377ebc802a93	elementary-1.15.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.17.0.tar.xz.sha256
+sha256	6a6a5883939eab8d87179c7980c0dbd6b53d82bf460a161045a891694d036b2b	elementary-1.17.0.tar.xz
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 7de0c7b..7fed4fb 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELEMENTARY_VERSION = 1.15.3
+ELEMENTARY_VERSION = 1.17.0
 ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.xz
 ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 ELEMENTARY_LICENSE = LGPLv2.1
-- 
2.5.5
