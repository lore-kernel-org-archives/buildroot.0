From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 13:31:47 +0300
Subject: [Buildroot] [PATCH] fftw: bump to version 3.3.8
Message-ID: <3619bd070c140a57243609898ce310d2d6611472.1530268307.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/fftw/fftw.hash | 6 +++---
 package/fftw/fftw.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index faf4b904c941..1c4a17d8c45b 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,5 +1,5 @@
-# From http://www.fftw.org/fftw-3.3.7.tar.gz.md5sum
-md5 0d5915d7d39b3253c1cc05030d79ac47  fftw-3.3.7.tar.gz
+# From http://www.fftw.org/fftw-3.3.8.tar.gz.md5sum
+md5 8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
 # Locally computed
-sha256 3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573	fftw-3.3.7.tar.gz
+sha256 6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303	fftw-3.3.7.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index b3aa4b6b146a..b167a2f6f7ef 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.7
+FFTW_VERSION = 3.3.8
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
-- 
2.18.0
