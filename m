From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 May 2019 10:02:13 +0200
Subject: [Buildroot] [PATCH] package/orc: bump version to 0.4.29
Message-ID: <20190506080214.15131-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of fixes. Release notes:

0.4.28: https://lists.freedesktop.org/archives/gstreamer-announce/2017-November/000449.html
0.4.29: https://lists.freedesktop.org/archives/gstreamer-announce/2019-April/000483.html

Also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.hash | 5 ++++-
 package/orc/orc.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index f47a9cfe5f..71dd3007ca 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,2 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/orc/orc-0.4.27.tar.xz.sha256sum
-sha256 51e53e58fc8158e5986a1f1a49a6d970c5b16493841cf7b9de2c2bde7ce36b93 orc-0.4.27.tar.xz
+sha256 4f8901f9144b5ec17dffdb33548b5f4c7f8049b0d1023be3462cdd64ec5a3ab2  orc-0.4.29.tar.xz
+
+# Locally calculated
+sha256 4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index ab718296ac..d121266bce 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.27
+ORC_VERSION = 0.4.29
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.11.0
