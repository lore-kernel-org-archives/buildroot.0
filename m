From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 27 Aug 2020 13:04:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/libyang: bump version to 1.0.184
Message-ID: <20200827110500.29809-1-heiko.thiery@gmail.com>
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
index 27bf8690c9..d318ecb9d6 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ee400695b79514535db1b58657d5d5e13f2ccf7186cc1af7d9bc574081bab2e  libyang-1.0.176.tar.gz
+sha256  1a5637451b73c4c5683837eb4c51371bb084795f653bc1a5fc20fed5541b58bc  libyang-1.0.184.tar.gz
 sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index c1ca51c36e..779c440e27 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.176
+LIBYANG_VERSION = 1.0.184
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
