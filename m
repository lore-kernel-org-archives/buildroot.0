From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  4 Jun 2020 14:33:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyang: bump to version 1.0.176
In-Reply-To: <20200604123333.24099-1-heiko.thiery@gmail.com>
References: <20200604123333.24099-1-heiko.thiery@gmail.com>
Message-ID: <20200604123333.24099-2-heiko.thiery@gmail.com>
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
index 52ce65516e..27bf8690c9 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2431fa5c7cfbe6a6f2c0873547b976f018438967adfe268726911dd3d95eaa31  libyang-1.0.167.tar.gz
+sha256  9ee400695b79514535db1b58657d5d5e13f2ccf7186cc1af7d9bc574081bab2e  libyang-1.0.176.tar.gz
 sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 766c14fdcd..95185b1f9b 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.167
+LIBYANG_VERSION = 1.0.176
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
