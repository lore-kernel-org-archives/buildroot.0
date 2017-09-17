From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 10:27:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/pcmanfm: bump version to 1.2.5
In-Reply-To: <20170917082727.28462-1-bernd.kuhls@t-online.de>
References: <20170917082727.28462-1-bernd.kuhls@t-online.de>
Message-ID: <20170917082727.28462-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcmanfm/pcmanfm.hash | 4 ++--
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index cb0d20669e..155e9beb82 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
-md5	19764c2f59653724c8713e0064fa6829	pcmanfm-1.2.4.tar.xz
-sha1	4768ee564a36021977e4af8c33270b6835b3391d	pcmanfm-1.2.4.tar.xz
+md5 b4d1f8ce08d87e4f27805a246fc51ac2  pcmanfm-1.2.5.tar.xz
+sha1 9a8a2b4abebdf859e5ba2486eff84d505ad17b89  pcmanfm-1.2.5.tar.xz
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index e1734363e4..31acae65bc 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.2.4
+PCMANFM_VERSION = 1.2.5
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
-- 
2.11.0
