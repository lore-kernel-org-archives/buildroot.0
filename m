From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Aug 2020 18:36:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.2.1
Message-ID: <20200818163642.20407-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi Thomas,

this is also a dependency for for iproute2 v5.8.0 (for ss) as it
contains commit 3e14bbcd ("wireup linux/name_to_handle_at and name_to_handle_at syscalls")

Kind regards,
Petr

 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 9d8b61e165..a988cf772b 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://musl.libc.org/releases/musl-1.2.0.tar.gz.asc
-sha256  c6de7b191139142d3f9a7b5b702c9cae1b5ee6e7f57e582da9328629408fd4e8  musl-1.2.0.tar.gz
+# https://musl.libc.org/releases/musl-1.2.1.tar.gz.asc
+sha256  68af6e18539f646f9c41a3a2bb25be4a5cfa5a8f65f0bb647fd2bbfdf877e84b  musl-1.2.1.tar.gz
 sha256  afe1df384787fce3577f3356b8b0d417381483f7c704eacb63f8050349fac77a  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 9482c0b246..bc4237968d 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.0
+MUSL_VERSION = 1.2.1
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.28.0
