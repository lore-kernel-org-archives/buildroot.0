From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Dec 2017 22:02:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/waylandpp: bump version to 0.1.6
In-Reply-To: <20171204210254.7852-1-bernd.kuhls@t-online.de>
References: <20171204210254.7852-1-bernd.kuhls@t-online.de>
Message-ID: <20171204210254.7852-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/waylandpp/waylandpp.hash | 2 +-
 package/waylandpp/waylandpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 7e793cc866..070cf7c73a 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 3d6d07a6fa4164c092608cdc53172af11138fbe7b7a9894090ca6502d8153448  waylandpp-0.1.5.tar.gz
+sha256 33d3ec385704c5545fb50d2283aabf4ef26aaaf3e416b292e650fea67c430d23  waylandpp-0.1.6.tar.gz
 sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 0054838876..f192a1286f 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.1.5
+WAYLANDPP_VERSION = 0.1.6
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
-- 
2.11.0
