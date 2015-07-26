From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:35 +0200
Subject: [Buildroot] [PATCH 09/12] python-pycrc16: Change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-10-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, python-pycrc16 has already made the move
to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/python-crc16/python-crc16.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
2.1.4
