From: Alexander Dahl <post@lespocky.de>
Date: Mon, 27 Apr 2020 09:11:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/zic: bump to version 2020a
In-Reply-To: <20200427071144.30237-1-post@lespocky.de>
References: <20200427071144.30237-1-post@lespocky.de>
Message-ID: <20200427071144.30237-3-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index cb6300e855..7fa86ac273 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html
-sha512 61ef36385f501c338c263081486de0d1fccd454b86f8777b0dbad4ea3f21bbde059d0a91c23e207b167ed013127d3db8b7528f0188814a8b44d1f946b19d9b8b tzcode2019c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html
+sha512 5235d6590e844491df32375857f5f36ba0046f2d21a078375188dff79b125cf9b69136a0a431624de1ecfa9d53b62a232f0e6ee0b734294cec62b670e6265cb2 tzcode2020a.tar.gz
 # Locally computed:
 sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index baa6479154..98f3bca58b 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2019c
+ZIC_VERSION = 2020a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.11.0
