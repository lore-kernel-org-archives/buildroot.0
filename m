From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Dec 2015 14:41:03 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2015.71
Message-ID: <1449164463-5525-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 4b2d99a..934b26b 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257  dropbear-2015.70.tar.bz2
+sha256	376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af  dropbear-2015.71.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index f32a60d..e7633ae 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2015.70
+DROPBEAR_VERSION = 2015.71
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
-- 
2.4.10
