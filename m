From: Stefan Ott <stefan@ott.net>
Date: Sat, 24 Oct 2020 03:15:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.12.0
Message-ID: <20201024011511.2135-1-stefan@ott.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 package/unbound/unbound.hash | 2 +-
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 650120d40e..c2c6ab7ff6 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9f2f0798f76eb8f30feaeda7e442ceed479bc54db0e3ac19c052d68685e51ef7  unbound-1.11.0.tar.gz
+sha256 5b9253a97812f24419bf2e6b3ad28c69287261cf8c8fa79e3e9f6d3bf7ef5835  unbound-1.12.0.tar.gz
 sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 6cf852ad9d..d60180b6ca 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.11.0
+UNBOUND_VERSION = 1.12.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.26.2
