From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 24 Nov 2015 18:57:12 -0300
Subject: [Buildroot] [PATCH] pcre: security bump to version 8.38
Message-ID: <1448402232-1972-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Fixes:
https://blog.fuzzing-project.org/29-Heap-Overflow-in-PCRE.html

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pcre/pcre.hash | 5 ++---
 package/pcre/pcre.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 0b2b1c4..5b580a7 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/pcre/files/pcre/8.37/
-md5	ed91be292cb01d21bc7e526816c26981	pcre-8.37.tar.bz2
-sha1	4c629b3f582366fae4e8912f0d9fa3140347d6e7	pcre-8.37.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df	pcre-8.38.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index fd339ed..06652c7 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.37
+PCRE_VERSION = 8.38
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c
-- 
2.4.10
