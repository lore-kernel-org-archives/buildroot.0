From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  9 Nov 2020 17:38:29 +0100
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.6
Message-ID: <20201109163829.2378448-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index fae3b73e80..9dfe2f2c23 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.5.tar.xz.sig
+# http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a  grep-3.5.tar.xz
+sha256  667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e  grep-3.6.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index bdc22fa46c..198dc854e9 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.5
+GREP_VERSION = 3.6
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.25.1
