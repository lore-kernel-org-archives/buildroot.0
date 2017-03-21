From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Mar 2017 15:11:22 +0200
Subject: [Buildroot] [PATCH] openssh: bump to version 7.5
Message-ID: <b556127655ac7c6e9c308e091067cb8a4f38574f.1490101882.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openssh/openssh.hash | 5 ++---
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 09010d3b29fc..3685bc0dbf69 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,2 @@
-# Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-7.4
-sha256 1b1fc4a14e2024293181924ed24872e6f2e06293f3e8926a376b8aec481f19d1  openssh-7.4p1.tar.gz
+# From http://www.openssh.com/txt/release-7.5 (base64 encoded)
+sha256 9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0  openssh-7.5p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ce37ee7ff2ba..ba48770afc6d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.4p1
+OPENSSH_VERSION = 7.5p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.11.0
