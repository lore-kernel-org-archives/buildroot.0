From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:45 +0100
Subject: [Buildroot] [PATCH 07/19] efl/libeina: bump to version 1.7.4
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8cba182b99f625da169b1ca9643ed165463e2963.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeina/libeina.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index e5b89c1..d99a237 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEINA_VERSION = 1.1.0
+LIBEINA_VERSION = 1.7.4
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
 LIBEINA_LICENSE = LGPLv2.1+
-- 
1.7.9.5
