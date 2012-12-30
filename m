From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:48 +0100
Subject: [Buildroot] [PATCH 10/19] efl/libevas: bump to version 1.7.4
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <58f10d0d1c51f4b1326153bb1aeeaa627b0a5925.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 1f053e3..8e03ba6 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEVAS_VERSION = 1.1.0
+LIBEVAS_VERSION = 1.7.4
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases/
 LIBEVAS_LICENSE = BSD-2c
-- 
1.7.9.5
