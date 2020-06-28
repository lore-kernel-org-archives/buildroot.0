From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jun 2020 10:51:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/unrar: bump version to 5.9.3
Message-ID: <20200628085149.616348-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 9bfc32d325..a15bcc704a 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  73d3baf18cf0a197976af2794a848893c35e7d42cee0ff364c89d2e476ebdaa6  unrarsrc-5.9.2.tar.gz
+sha256  28c176c29da86d7efe3cb9a227255d8340f761ba95969195982ec87c8eb2dd69  unrarsrc-5.9.3.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 5c6f4b58da..9903c55d09 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.9.2
+UNRAR_VERSION = 5.9.3
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
-UNRAR_SITE = http://www.rarlab.com/rar
+UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
 
-- 
2.26.2
