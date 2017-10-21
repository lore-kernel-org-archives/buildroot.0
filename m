From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Oct 2017 20:02:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20171021180251.9170-1-bernd.kuhls@t-online.de>
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
index 515c36ab99..f9fd385e9b 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d61a6e45d0aef2370885be4c58ed95eaa36b2ba1d8fbb75f7759ddc08e020487  tvheadend-0d1cd06fb237504123a08de84afc25d73fa14ba8.tar.gz
+sha256 7ff9f6a583d7e288c69eb8bfbd628e630e85252e04a8394666cc3c9f9b785df3  tvheadend-a234e2ff6d140e6ffceb7057bf18a8fdd927a5ac.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 3eb9161a46..88f9869fa6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 0d1cd06fb237504123a08de84afc25d73fa14ba8
+TVHEADEND_VERSION = a234e2ff6d140e6ffceb7057bf18a8fdd927a5ac
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.11.0
