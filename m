From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 13 Oct 2020 17:47:49 +0200
Subject: [Buildroot] [PATCH] package/unrar: bump to version 5.9.4
Message-ID: <20201013154749.696403-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index a15bcc704..7900c44d1 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  28c176c29da86d7efe3cb9a227255d8340f761ba95969195982ec87c8eb2dd69  unrarsrc-5.9.3.tar.gz
+sha256  3d010d14223e0c7a385ed740e8f046edcbe885e5c22c5ad5733d009596865300  unrarsrc-5.9.4.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 9903c55d0..ab8d9228c 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.9.3
+UNRAR_VERSION = 5.9.4
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.25.1
