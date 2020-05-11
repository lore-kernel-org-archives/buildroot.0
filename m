From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 11 May 2020 21:56:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/libyang: bump to version 1.0.167
Message-ID: <20200511195649.10398-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 9e1f60492e..52ce65516e 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c9703079f10fbf7154882562322b4b01764bc7735345da555ca51201b02e536c  libyang-1.0.130.tar.gz
+sha256  2431fa5c7cfbe6a6f2c0873547b976f018438967adfe268726911dd3d95eaa31  libyang-1.0.167.tar.gz
 sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 4e47c9f5fc..766c14fdcd 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.130
+LIBYANG_VERSION = 1.0.167
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
