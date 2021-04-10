From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 14:14:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/igmpproxy: bump to version 0.3
Message-ID: <20210410121451.73529-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indention in hash file (two spaces)
- Use official tarball

https://github.com/pali/igmpproxy/releases/tag/0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igmpproxy/igmpproxy.hash | 8 ++++----
 package/igmpproxy/igmpproxy.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index 2566987a7f..238de67e88 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 6faa1f42ba323f60a9eb4958550e25b2e7e9c645da32c52ba12db0c9bdfce1ba  igmpproxy-0.2.1.tar.gz
-sha256 be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
-sha256 c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
-sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
+sha256  d1fc244cb2fbbf99f720bda3e841fe59ece9b6919073790b4b892739b1b844eb  igmpproxy-0.3.tar.gz
+sha256  be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
+sha256  c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
+sha256  4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index fe4614fd13..6a6b56afa0 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IGMPPROXY_VERSION = 0.2.1
-IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
+IGMPPROXY_VERSION = 0.3
+IGMPPROXY_SITE = \
+	https://github.com/pali/igmpproxy/releases/download/$(IGMPPROXY_VERSION)
 IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
 IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
-- 
2.30.2
