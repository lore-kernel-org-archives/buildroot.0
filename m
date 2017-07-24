From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 19:19:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/jo: bump version to 1.1
Message-ID: <20170724171957.15655-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jo/jo.hash | 2 +-
 package/jo/jo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index 429f1e4a9..736b0fb8f 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	d66ec97258d1afad15643fb2d5b5e807153a732ba45c2417adc66669acbde52e  jo-1.0.tar.gz
+sha256 63ed4766c2e0fcb5391a14033930329369f437d7060a11d82874e57e278bda5f  jo-1.1.tar.gz
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index c325c5cea..ad085b29f 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.0
+JO_VERSION = 1.1
 JO_SITE = https://github.com/jpmens/jo/releases/download/v$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
-- 
2.11.0
