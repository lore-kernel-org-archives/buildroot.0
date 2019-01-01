From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 Jan 2019 18:33:24 +0100
Subject: [Buildroot] [PATCH] package/valijson: bump to version 0.1
Message-ID: <20190101173324.13402-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The v0.1 tag is the first (and only) tag of the project, and has been
done after commit 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186 that we
currently use as a valijson version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index 79b3fb7d69..ffa1281797 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,2 +1,2 @@
 # Locally Computed:
-sha256  f2346e995bd95c6b86b0b9e9dd228fe134d529565fa86db764c48496805dd9bc  valijson-424b706f990a9eb96dfc19cc8e54f2cd6ce5e186.tar.gz
+sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-v0.1.tar.gz
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 71bd6a8fb0..e1b816ddd7 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186
+VALIJSON_VERSION = v0.1
 VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-- 
2.20.1
