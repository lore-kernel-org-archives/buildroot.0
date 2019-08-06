From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:24:53 +0200
Subject: [Buildroot] [git commit] package/gpsd: add whitespaces
Message-ID: <20190806202213.8E0488E4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5692ffca98c8efbfc860e01b5339812007291e47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
