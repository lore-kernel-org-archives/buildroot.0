From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Aug 2019 07:19:19 +0200
Subject: [Buildroot] [PATCH 1/3] package/gpsd: add whitespaces
Message-ID: <20190806051921.28680-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gpsd/gpsd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index b4d0778b18..f1c7bb7349 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -18,11 +18,11 @@ GPSD_CFLAGS = $(TARGET_CFLAGS)
 GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
 GPSD_SCONS_OPTS = \
-	arch=$(ARCH)\
+	arch=$(ARCH) \
 	manbuild=no \
-	prefix=/usr\
-	sysroot=$(STAGING_DIR)\
-	strip=no\
+	prefix=/usr \
+	sysroot=$(STAGING_DIR) \
+	strip=no \
 	python=no \
 	qt=no
 
-- 
2.20.1
