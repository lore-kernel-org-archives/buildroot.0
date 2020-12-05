From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Dec 2020 09:01:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: bump version to 2.6.0
Message-ID: <20201205080159.2382277-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Release notes:
https://github.com/JuliaStrings/utf8proc/releases/tag/v2.6.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/utf8proc/utf8proc.hash | 4 ++--
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index f7b8776a53..7b60db572d 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d4e8dfc898cfd062493cb7f42d95d70ccdd3a4cd4d90bec0c71b47cca688f1be  utf8proc-2.5.0.tar.gz
-sha256 fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
+sha256  b36ce1534b8035e7febd95c031215ed279ee9d31cf9b464e28b4c688133b22c5  utf8proc-2.6.0.tar.gz
+sha256  fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 2bb1939914..50f0c6362b 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.5.0
+UTF8PROC_VERSION = 2.6.0
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
-- 
2.29.2
