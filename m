From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 09:49:55 +0100
Subject: [Buildroot] [git commit] package/utf8proc: bump version to 2.6.1
Message-ID: <20210117083229.3D8238148C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc9fc56c6824c8e6fda7901b5cf4148e30c5826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/utf8proc/utf8proc.hash | 2 +-
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 7b60db572d..2deff4e0c5 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b36ce1534b8035e7febd95c031215ed279ee9d31cf9b464e28b4c688133b22c5  utf8proc-2.6.0.tar.gz
+sha256  4c06a9dc4017e8a2438ef80ee371d45868bda2237a98b26554de7a95406b283b  utf8proc-2.6.1.tar.gz
 sha256  fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 50f0c6362b..bedd38ca53 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.6.0
+UTF8PROC_VERSION = 2.6.1
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
