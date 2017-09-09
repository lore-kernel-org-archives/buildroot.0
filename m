From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  9 Sep 2017 12:34:19 +0200
Subject: [Buildroot] [PATCH 7/9] s6-portable-utils: bump version to 2.2.1.1
In-Reply-To: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
References: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170909103421.30675-8-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-portable-utils/s6-portable-utils.hash | 2 +-
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index d9e7beabe1..52097ed380 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 15b044017a1d24432affa26945793aaf93fff03ad0c0ff10a3a4973277fc009b  s6-portable-utils-2.2.1.0.tar.gz
+sha256 6ae239d2c458a81c92b5d616129e443874f925bf3da02589913a1a3b708c4531  s6-portable-utils-2.2.1.1.tar.gz
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 9be52e72ff..a15bca1ed6 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.1.0
+S6_PORTABLE_UTILS_VERSION = 2.2.1.1
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
-- 
2.13.5
