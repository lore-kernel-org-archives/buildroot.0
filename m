From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 Jan 2015 21:14:46 -0300
Subject: [Buildroot] [PATCH 1/2] bison: bump to version 3.0.4
Message-ID: <1422231287-5770-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.hash | 2 +-
 package/bison/bison.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index dd10086..16913f2 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5940efbdd6b5d80e55ec16a01d2322e2892da21863391049b9b692570649177c	bison-3.0.3.tar.xz
+sha256	a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1	bison-3.0.4.tar.xz
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 45f785e..76ceb6e 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.0.3
+BISON_VERSION = 3.0.4
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
-- 
2.0.5
