From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:34:36 +0200
Subject: [Buildroot] [git commit] tesseract-ocr: bump to version 3.05.02
Message-ID: <20180930084530.C9F6C80FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803bc88a72151996b8dc73fcce2f65cd6fd6e359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license hash

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 3 ++-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 9bb5b522ac..09c7a71914 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,6 @@
 # locally computed
-sha256  3fe83e06d0f73b39f6e92ed9fc7ccba3ef734877b76aa5ddaaa778fac095d996  tesseract-ocr-3.05.00.tar.gz
+sha256  494d64ffa7069498a97b909a0e65a35a213989e0184f1ea15332933a90d43445  tesseract-ocr-3.05.02.tar.gz
+sha256  d770c1ac1235bc018530701da1ce453367f7952a3075d12b9029f81a26c05f13  COPYING
 sha256  c0515c9f1e0c79e1069fcc05c2b2f6a6841fb5e1082d695db160333c1154f06d  eng.traineddata
 sha256  86afb23ad146467f263e8ade56fd3951b1cc28f8c4eebc34f993d3c02d88a7ab  fra.traineddata
 sha256  cb7eb42a7e972cec7ef904fe81825d7b547c46df684c814fdb11a930b13bca3a  deu.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 919a4360ed..77b218121d 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 3.05.00
+TESSERACT_OCR_VERSION = 3.05.02
 TESSERACT_OCR_DATA_VERSION = 3.04.00
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
