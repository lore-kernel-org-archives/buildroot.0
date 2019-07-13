From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 13 Jul 2019 08:58:25 +0200
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 4.1.0
In-Reply-To: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
References: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1563001107-17687-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index d953758..8de25e2 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  a1f5422ca49a32e5f35c54dee5112b11b99928fc9f4ee6695cdc6768d69f61dd  tesseract-ocr-4.0.0.tar.gz
+sha256  5c5ed5f1a76888dc57a83704f24ae02f8319849f5c4cf19d254296978a1a1961  tesseract-ocr-4.1.0.tar.gz
 sha256  d770c1ac1235bc018530701da1ce453367f7952a3075d12b9029f81a26c05f13  COPYING
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 74b3449..2cc0459 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 4.0.0
+TESSERACT_OCR_VERSION = 4.1.0
 TESSERACT_OCR_DATA_VERSION = 4.0.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.7.4
