From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 09:38:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: bump version to 2.5.0
Message-ID: <20200413073844.407777-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://github.com/JuliaStrings/utf8proc/blob/master/NEWS.md

Updated license hash due to upstream commit:
https://github.com/JuliaStrings/utf8proc/commit/0dc0fcf8db4ae2ff1971d4f0f86a2d83b14d863d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/utf8proc/utf8proc.hash | 4 ++--
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index da85a3c7cc..f7b8776a53 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b2e5d547c1d94762a6d03a7e05cea46092aab68636460ff8648f1295e2cdfbd7  utf8proc-2.4.0.tar.gz
-sha256 6acb7a86aca74317c6b4dddc2eadeb53bededb95a94a48c3fcd517f4473a653d  LICENSE.md
+sha256 d4e8dfc898cfd062493cb7f42d95d70ccdd3a4cd4d90bec0c71b47cca688f1be  utf8proc-2.5.0.tar.gz
+sha256 fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 2d60387e70..2bb1939914 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.4.0
+UTF8PROC_VERSION = 2.5.0
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
-- 
2.25.0
