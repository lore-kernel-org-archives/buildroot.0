From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 10:10:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/gob2: add license
Message-ID: <20191124091051.1017317-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gob2/gob2.hash | 1 +
 package/gob2/gob2.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gob2/gob2.hash b/package/gob2/gob2.hash
index 3678bdd5c9..b7db5c6f0b 100644
--- a/package/gob2/gob2.hash
+++ b/package/gob2/gob2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026  gob2-2.0.20.tar.xz
+sha256 b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index fe60673821..325dc2433a 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,6 +7,8 @@
 GOB2_VERSION = 2.0.20
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
 GOB2_SITE = http://ftp.5z.com/pub/gob
+GOB2_LICENSE = GPL-2.0+
+GOB2_LICENSE_FILES = COPYING
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 
 $(eval $(host-autotools-package))
-- 
2.24.0
