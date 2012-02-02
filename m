From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 16:16:10 +0100
Subject: [Buildroot] [git commit] python-serial: bump to 2.6
Message-ID: <20120202151637.57A799099A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=faf266b460c339019aab446c454b358492887c45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
