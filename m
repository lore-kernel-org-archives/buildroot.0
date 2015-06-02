From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 13:59:04 -0300
Subject: [Buildroot] [PATCH] gawk: bump to version 4.1.3
Message-ID: <1433264344-22172-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/gawk.hash | 2 +-
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 8720031..7f746d8 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ea8b53c5834ee27012fecba7273f97fca7104884975cf81ddae6f85c5581f481	gawk-4.1.2.tar.xz
+sha256	e3cf55e91e31ea2845f8338bedd91e40671fc30e4d82ea147d220e687abda625	gawk-4.1.3.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 653a5a0..1820689 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.2
+GAWK_VERSION = 4.1.3
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
-- 
2.3.6
