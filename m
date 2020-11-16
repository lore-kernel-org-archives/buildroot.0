From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon, 16 Nov 2020 20:09:18 +0000
Subject: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.0
Message-ID: <20201116200918.18087-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 57ce91ac80..87e0cf8ea0 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,4 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/08/msg00000.html
-sha256  1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7  chrony-3.5.1.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/10/msg00000.html
+sha256  be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625  chrony-4.0.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f8938a80f5..dcaac0c8ac 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.5.1
+CHRONY_VERSION = 4.0
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.17.1
