From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 16:17:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 8.5.0
In-Reply-To: <20170913141733.11538-1-bernd.kuhls@t-online.de>
References: <20170913141733.11538-1-bernd.kuhls@t-online.de>
Message-ID: <20170913141733.11538-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index a0643b5958..c1d16529a1 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.4.0/SHASUMS256.txt
-sha256  5d5aa2a101dcc617231a475812eb8ed87cac21491f1dcc7997b9dd463563f361  node-v8.4.0.tar.xz
+# From http://nodejs.org/dist/v8.5.0/SHASUMS256.txt
+sha256 e1cde5d8e5049e7e1b61aef128f26162059d885dc8cab5014bf5cbf693f75c3c  node-v8.5.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3570a8fad9..fe503930d7 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.4.0
+NODEJS_VERSION = 8.5.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.11.0
