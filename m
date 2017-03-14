From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 14 Mar 2017 19:44:24 +0100
Subject: [Buildroot] [PATCH 0/3] Introducing tesseract OCR engine package
Message-ID: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces the tesseract OCR engine, some of its associated
language data and the main library it depends on, leptonica.

Gilles Talis (3):
  leptonica: new package
  tesseract-ocr: new package
  DEVELOPERS: add leptonica and tesseract-ocr to my list

 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  3 ++
 package/leptonica/Config.in                        |  9 ++++
 package/leptonica/leptonica.hash                   |  2 +
 package/leptonica/leptonica.mk                     | 57 ++++++++++++++++++++++
 package/tesseract-ocr-data/Config.in               | 15 ++++++
 .../tesseract-ocr-data-chi-sim/Config.in           |  6 +++
 .../tesseract-ocr-data-chi-sim.hash                |  2 +
 .../tesseract-ocr-data-chi-sim.mk                  | 21 ++++++++
 .../tesseract-ocr-data-chi-tra/Config.in           |  6 +++
 .../tesseract-ocr-data-chi-tra.hash                |  2 +
 .../tesseract-ocr-data-chi-tra.mk                  | 21 ++++++++
 .../tesseract-ocr-data-eng/Config.in               |  6 +++
 .../tesseract-ocr-data-eng.hash                    |  2 +
 .../tesseract-ocr-data-eng.mk                      | 21 ++++++++
 .../tesseract-ocr-data-fra/Config.in               |  5 ++
 .../tesseract-ocr-data-fra.hash                    |  2 +
 .../tesseract-ocr-data-fra.mk                      | 21 ++++++++
 .../tesseract-ocr-data-ger/Config.in               |  5 ++
 .../tesseract-ocr-data-ger.hash                    |  2 +
 .../tesseract-ocr-data-ger.mk                      | 21 ++++++++
 .../tesseract-ocr-data-spa/Config.in               |  5 ++
 .../tesseract-ocr-data-spa.hash                    |  2 +
 .../tesseract-ocr-data-spa.mk                      | 21 ++++++++
 package/tesseract-ocr-data/tesseract-ocr-data.mk   | 10 ++++
 package/tesseract-ocr/Config.in                    | 35 +++++++++++++
 package/tesseract-ocr/tesseract-ocr.hash           |  3 ++
 package/tesseract-ocr/tesseract-ocr.mk             | 31 ++++++++++++
 28 files changed, 338 insertions(+)
 create mode 100644 package/leptonica/Config.in
 create mode 100644 package/leptonica/leptonica.hash
 create mode 100644 package/leptonica/leptonica.mk
 create mode 100644 package/tesseract-ocr-data/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data.mk
 create mode 100644 package/tesseract-ocr/Config.in
 create mode 100644 package/tesseract-ocr/tesseract-ocr.hash
 create mode 100644 package/tesseract-ocr/tesseract-ocr.mk

-- 
2.5.0
