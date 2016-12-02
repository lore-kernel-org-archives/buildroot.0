From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri,  2 Dec 2016 23:34:00 +0100
Subject: [Buildroot] [PATCH] package/tinc: upgrade to upstream version 1.0.30
Message-ID: <1480718040-23917-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/tinc/tinc.hash | 2 +-
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 0cccbbf..135a4f3 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0b502699360f09ce2128a39cf02abca07bfc699fc02ce829b3a90cf5e1e8b344	tinc-1.0.28.tar.gz
+sha256	abc17e25afc1b9e74423c78fef586b11d503cbbbe5e4a2ed323870f4a82faa73 tinc-1.0.30.tar.gz
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index fb15c34..6d87cbf 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.28
+TINC_VERSION = 1.0.30
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPLv2+ with OpenSSL exception
-- 
2.7.4
