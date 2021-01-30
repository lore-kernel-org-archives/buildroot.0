From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Jan 2021 22:40:27 +0100
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump to version 1.0.215
In-Reply-To: <20210130214028.26398-1-heiko.thiery@gmail.com>
References: <20210130214028.26398-1-heiko.thiery@gmail.com>
Message-ID: <20210130214028.26398-2-heiko.thiery@gmail.com>
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
index d318ecb9d6..bc9e948c03 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a5637451b73c4c5683837eb4c51371bb084795f653bc1a5fc20fed5541b58bc  libyang-1.0.184.tar.gz
+sha256  c4498a77a7c12a28c9911f993eeafbf2badd2ecea58bb74781bd61cfc635e4c9  libyang-1.0.215.tar.gz
 sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index b4b82a9df7..ee24256bed 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.184
+LIBYANG_VERSION = 1.0.215
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
