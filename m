From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:43 +0100
Subject: [Buildroot] [PATCH 05/19] efl/libeet: bump to version 1.7.4
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a5d3241f3bb620f7479e30c12bcc632734663792.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeet/libeet.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index ccb3501..a5a1ce1 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEET_VERSION = 1.5.0
+LIBEET_VERSION = 1.7.4
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_LICENSE = BSD-2c
-- 
1.7.9.5
