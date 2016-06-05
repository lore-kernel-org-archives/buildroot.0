From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:00 +0200
Subject: [Buildroot] [PATCH 07/28] package/gr-osmosdr: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index ce6e84a..337f3ef 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 d40462dddc0ebd769b2df3c6ad6fe82c9e9a4a73f7b3c5ce53efbce724906290 gr-osmosdr-a45968f3381f33b86ca344bb76bd62c131d98d93.tar.gz
+sha256 274960cd32bc8a7216eeed8967bf078efd6123332808b405ec42c24a7e426b7c gr-osmosdr-164a09fc11cec2d8b15b38e8b512fa542d6cecc7.tar.gz
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 6a0cc26..d7c3d62 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = a45968f3381f33b86ca344bb76bd62c131d98d93
+GR_OSMOSDR_VERSION = 164a09fc11cec2d8b15b38e8b512fa542d6cecc7
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPLv3+
 GR_OSMOSDR_LICENSE_FILES = COPYING
-- 
2.8.1
