From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:31:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: bump version to 1.0.4
Message-ID: <20191104073117.8803-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ndisc6/ndisc6.hash | 4 +++-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index e37e33e654..381667c2cf 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 0f41d6caf5f2edc1a12924956ae8b1d372e3b426bd7b11eed7d38bc974eec821  ndisc6-1.0.3.tar.bz2
+sha256 abb1da4a98d94e5abe1dd7b1c975de540306b0581cbbd36aff035118b2f25c1f  ndisc6-1.0.4.tar.bz2
+# Locally computed
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index eb4fbbbc27..38eeb00567 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.3
+NDISC6_VERSION = 1.0.4
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)
-- 
2.20.1
