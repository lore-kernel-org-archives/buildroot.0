From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Jan 2017 10:27:19 -0300
Subject: [Buildroot] [PATCH] pcre: bump to version 8.40
Message-ID: <20170113132719.25590-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pcre/pcre.hash | 2 +-
 package/pcre/pcre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index bc50042..4c3c6c3 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b	pcre-8.39.tar.bz2
+sha256	00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4	pcre-8.40.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index a10950d..211e235 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.39
+PCRE_VERSION = 8.40
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c
-- 
2.10.2
