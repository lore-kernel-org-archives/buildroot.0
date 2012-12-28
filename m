From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:41:56 +0100
Subject: [Buildroot] [PATCH 03/20] efl/libedbus: bump to version 1.7.4
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <00e98062db58e4f9b9f831904ec1348fbe44d5cd.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libedbus/libedbus.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 60651e3..9c62ead 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEDBUS_VERSION = 1.1.0
+LIBEDBUS_VERSION = 1.7.4
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases/
 LIBEDBUS_LICENSE = BSD-2c
-- 
1.7.9.5
