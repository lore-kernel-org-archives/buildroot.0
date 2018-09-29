From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 29 Sep 2018 17:08:58 +0200
Subject: [Buildroot] [PATCH 0/6] Upgrade some of the packages I maintain
Message-ID: <1538233744-7607-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
This set of patches upgrades some of the packages I maintain.
It also adds missing licenses hashes

Cheers
Gilles.

Gilles Talis (6):
  webp: bump to version 1.0.0
  leptonica: bump to version 1.76.0
  tesseract-ocr: bump to version 3.05.02
  ocrad: add license hash
  httping: add license hash
  iozone: bump to version 3_482

 package/httping/httping.hash                       |   1 +
 .../iozone/0001-Add-new-targets-for-iozone.patch   | 103 +++++++++++++++++++++
 package/iozone/0001-targets.patch                  |  92 ------------------
 package/iozone/iozone.hash                         |   2 +-
 package/iozone/iozone.mk                           |   2 +-
 package/leptonica/leptonica.hash                   |   3 +-
 package/leptonica/leptonica.mk                     |   2 +-
 package/ocrad/ocrad.hash                           |   1 +
 package/tesseract-ocr/tesseract-ocr.hash           |   3 +-
 package/tesseract-ocr/tesseract-ocr.mk             |   2 +-
 package/webp/webp.hash                             |   2 +-
 package/webp/webp.mk                               |   2 +-
 12 files changed, 115 insertions(+), 100 deletions(-)
 create mode 100644 package/iozone/0001-Add-new-targets-for-iozone.patch
 delete mode 100644 package/iozone/0001-targets.patch

-- 
2.7.4
