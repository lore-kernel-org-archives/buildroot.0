From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Aug 2016 16:03:56 -0300
Subject: [Buildroot] [PATCH] gawk: bump to version 4.1.4
Message-ID: <1472238236-20722-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7f746d8..e2c7806 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e3cf55e91e31ea2845f8338bedd91e40671fc30e4d82ea147d220e687abda625	gawk-4.1.3.tar.xz
+sha256	53e184e2d0f90def9207860531802456322be091c7b48f23fdc79cda65adc266	gawk-4.1.4.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index b5b0f8d..7c6689b 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.3
+GAWK_VERSION = 4.1.4
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.7.3
