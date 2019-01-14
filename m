From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:16:13 +0100
Subject: [Buildroot] [git commit] package/tesseract-ocr: bump to version
 4.0.0
Message-ID: <20190114211751.600648D4E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dab729c58bdec7975db8d3b6984e9c0bf4d28ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 14 +++++++-------
 package/tesseract-ocr/tesseract-ocr.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 09c7a71914..d953758841 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,9 +1,9 @@
 # locally computed
-sha256  494d64ffa7069498a97b909a0e65a35a213989e0184f1ea15332933a90d43445  tesseract-ocr-3.05.02.tar.gz
+sha256  a1f5422ca49a32e5f35c54dee5112b11b99928fc9f4ee6695cdc6768d69f61dd  tesseract-ocr-4.0.0.tar.gz
 sha256  d770c1ac1235bc018530701da1ce453367f7952a3075d12b9029f81a26c05f13  COPYING
-sha256  c0515c9f1e0c79e1069fcc05c2b2f6a6841fb5e1082d695db160333c1154f06d  eng.traineddata
-sha256  86afb23ad146467f263e8ade56fd3951b1cc28f8c4eebc34f993d3c02d88a7ab  fra.traineddata
-sha256  cb7eb42a7e972cec7ef904fe81825d7b547c46df684c814fdb11a930b13bca3a  deu.traineddata
-sha256  f23985996bbcfe2b57864ccb082783c1c74c87429f04411a04a6ba4d3da2efda  spa.traineddata
-sha256  323ae74d4a2ff49e932dbb4d6282fe0e67ddfafda075ec85803ecd077207454c  chi_sim.traineddata
-sha256  774d566bd0b36e4b6c07415dfa5b6b57feb2575b1f5f231d7fe01a52dac5dd0e  chi_tra.traineddata
+sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
+sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
+sha256  896b3b4956503ab9daa10285db330881b2d74b70d889b79262cc534b9ec699a4  deu.traineddata
+sha256  0b0fcbb4665189e01ab8019e591f014dd7260460de072543edd4b2cb4ede7c96  spa.traineddata
+sha256  fc05d89ab31d8b4e226910f16a8bcbf78e43bae3e2580bb5feefd052efdab363  chi_sim.traineddata
+sha256  559067dc0f7c94788884742129d66a0117dde7f4ff12b263d92147173497db14  chi_tra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 77b218121d..0b92a1f3b5 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 3.05.02
-TESSERACT_OCR_DATA_VERSION = 3.04.00
+TESSERACT_OCR_VERSION = 4.0.0
+TESSERACT_OCR_DATA_VERSION = 4.0.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = COPYING
