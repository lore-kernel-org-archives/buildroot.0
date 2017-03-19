From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 19 Mar 2017 09:07:51 +0100
Subject: [Buildroot] [PATCH v2 0/2] Introducing tesseract OCR engine
Message-ID: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2 of the patch series that introduces tesseract OCR engine, its data
and leptonica, the library it mainly depends on.

Gilles Talis (2):
  leptonica: new package
  tesseract-ocr: new package

 DEVELOPERS                               |  2 +
 package/Config.in                        |  2 +
 package/leptonica/Config.in              |  8 ++++
 package/leptonica/leptonica.hash         |  2 +
 package/leptonica/leptonica.mk           | 64 +++++++++++++++++++++++++++++
 package/tesseract-ocr/Config.in          | 44 ++++++++++++++++++++
 package/tesseract-ocr/tesseract-ocr.hash |  8 ++++
 package/tesseract-ocr/tesseract-ocr.mk   | 69 ++++++++++++++++++++++++++++++++
 8 files changed, 199 insertions(+)
 create mode 100644 package/leptonica/Config.in
 create mode 100644 package/leptonica/leptonica.hash
 create mode 100644 package/leptonica/leptonica.mk
 create mode 100644 package/tesseract-ocr/Config.in
 create mode 100644 package/tesseract-ocr/tesseract-ocr.hash
 create mode 100644 package/tesseract-ocr/tesseract-ocr.mk

-- 
2.5.0
