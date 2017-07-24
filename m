From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Jul 2017 06:59:52 +0300
Subject: [Buildroot] [PATCH 1/3] grep: bump to version 3.1
Message-ID: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/grep/grep.hash | 4 +++-
 package/grep/grep.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 77420ad69483..10a5e320e410 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking signature
-sha256 e2c81db5056e3e8c5995f0bb5d0d0e1cad1f6f45c3b2fc77b6e81435aed48ab5  grep-3.0.tar.xz
+# http://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz.sig
+sha256 db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e  grep-3.1.tar.xz
+sha256 ca372a7d92560b1fa9f6d832b440e8bcd62d9adfa8870c98287deab66d98310e  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index a2ef4222698d..cfbf2ec7b537 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.0
+GREP_VERSION = 3.1
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.13.2
