From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2019 13:37:44 +0100
Subject: [Buildroot] [PATCH 0/7] Update packages
Message-ID: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
This set of patches upgrades some of the packages I maintain:
- fdk-aac
- iozone
- leptonica
- tesseract
- webp
- xapian

Cheers
Gilles.

Gilles Talis (7):
  fdk-aac: enable for aarch64
  fdk-aac: bump to version 2.0.0
  iozone: bump to version 3_483
  leptonica: bump to version 1.77.0
  webp: bump to version 1.0.1
  xapian: bump to version 1.4.9
  tesseract-ocr: bump to version 4.0.0

 package/fdk-aac/Config.in                |  1 +
 package/fdk-aac/fdk-aac.hash             |  8 ++++----
 package/fdk-aac/fdk-aac.mk               |  2 +-
 package/iozone/iozone.hash               |  2 +-
 package/iozone/iozone.mk                 |  2 +-
 package/leptonica/leptonica.hash         |  2 +-
 package/leptonica/leptonica.mk           |  2 +-
 package/tesseract-ocr/tesseract-ocr.hash | 14 +++++++-------
 package/tesseract-ocr/tesseract-ocr.mk   |  4 ++--
 package/webp/webp.hash                   |  2 +-
 package/webp/webp.mk                     |  2 +-
 package/xapian/xapian.hash               |  2 +-
 package/xapian/xapian.mk                 |  2 +-
 13 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.7.4
