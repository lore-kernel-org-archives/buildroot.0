From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jan 2019 18:59:55 +0100
Subject: [Buildroot] [PATCH 3/3] gnuchess: bump to version 6.2.5
In-Reply-To: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
References: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
Message-ID: <20190110175955.31565-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index e0a1c4c418..9342fc3eb7 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 3c425c0264f253fc5cc2ba969abe667d77703c728770bd4b23c456cbe5e082ef  gnuchess-6.2.4.tar.gz
+sha256 9a99e963355706cab32099d140b698eda9de164ebce40a5420b1b9772dd04802  gnuchess-6.2.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index b2fbcff864..0c8c3b836c 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.4
+GNUCHESS_VERSION = 6.2.5
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
-- 
2.14.1
