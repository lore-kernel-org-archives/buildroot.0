From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Feb 2012 15:01:54 +0100
Subject: [Buildroot] [PATCH] python-serial: bump to 2.6
Message-ID: <1328191314-4716-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-serial/python-serial.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 4c8a891..add9667 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PYTHON_SERIAL_VERSION = 2.5
+PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial/
 
-- 
1.7.1.1
