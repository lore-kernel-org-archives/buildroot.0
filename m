From: Mike Williams <mike@mikebwilliams.com>
Date: Fri,  6 Mar 2015 12:20:22 -0500
Subject: [Buildroot] [PATCH] libqmi: bump to 1.12.6
Message-ID: <1425662422-23222-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ModemManager 1.4.4 requires libqmi >= 1.12.4.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index f5f2578..a2c37d3 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624  libqmi-1.12.2.tar.xz
+sha256  0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780  libqmi-1.12.6.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 9e5f9cb..1bc6121 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.12.2
+LIBQMI_VERSION = 1.12.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.0
