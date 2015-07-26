From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:16:56 +0200
Subject: [Buildroot] [git commit branch/next] python-pycrc16: Change site
Message-ID: <20150808105642.C3A707FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9603574567f77a262d0da1311d19b088bef68e75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Google Code is a closing forge, python-pycrc16 has already made the move
to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-crc16/python-crc16.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 5b9b13b..3a292a0 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 PYTHON_CRC16_VERSION = 0.1.1
-PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
-PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files
+PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
 PYTHON_CRC16_LICENSE = LGPLv3+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = distutils
