From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 23:56:47 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/coreutils: bump version to 8.27
In-Reply-To: <20170525215647.10315-1-bernd.kuhls@t-online.de>
References: <20170525215647.10315-1-bernd.kuhls@t-online.de>
Message-ID: <20170525215647.10315-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 37d630bba..472cab55f 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e	coreutils-8.26.tar.xz
+sha256 8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b  coreutils-8.27.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0769bca0d..14b952f5a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.26
+COREUTILS_VERSION = 8.27
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.11.0
