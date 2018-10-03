From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 10:23:35 +0200
Subject: [Buildroot] [PATCH 4/4] package/tvheadend: bump version
In-Reply-To: <20181003082335.25840-1-bernd.kuhls@t-online.de>
References: <20181003082335.25840-1-bernd.kuhls@t-online.de>
Message-ID: <20181003082335.25840-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index ce275f132f..43178b874a 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3389e857651665cc1fe96e624ffe12ad1ec28f31d396f0579fcaa47536fb6400  tvheadend-9b9ee6859be90fedb5d43ad1d770dfcdb8b1caf4.tar.gz
+sha256 92c5f2cdda085b81fc50025afeb3ece74f60fae2b26f40a7dd07e227b0db2d9f  tvheadend-17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5ebb98b941..e92c111082 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 9b9ee6859be90fedb5d43ad1d770dfcdb8b1caf4
+TVHEADEND_VERSION = 17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.19.0
