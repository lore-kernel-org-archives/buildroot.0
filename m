From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:59:22 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 0.12.0
Message-ID: <20150907221138.364A781E80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7cc46b48f27e146e1327bccd6f99762c4b83afb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.hash |    4 ++--
 package/upmpdcli/upmpdcli.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 762b0af..c8dc318 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.11.2.tar.gz.sha256
-sha256 595865c306b0076baaff7eb4f76f779119bd8952f53a4e6662157dc83ab70d89  upmpdcli-0.11.2.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.12.0.tar.gz.sha256
+sha256 7862fc599fc60dfdf22bbbf7e134655d29c51a8ccc6b5cc81232f7bc4a7351c9  upmpdcli-0.12.0.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index c69e01c..74413ae 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.11.2
+UPMPDCLI_VERSION = 0.12.0
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
