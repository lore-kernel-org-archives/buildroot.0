From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 26 Dec 2015 00:14:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/upmpcli: bump to version 0.13.1
In-Reply-To: <1451085287-18089-1-git-send-email-joerg.krause@embedded.rocks>
References: <1451085287-18089-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1451085287-18089-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli version 0.13.1 requires libupnpp version 0.13.1 to build successfully.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index c8dc318..5a6c47a 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.12.0.tar.gz.sha256
-sha256 7862fc599fc60dfdf22bbbf7e134655d29c51a8ccc6b5cc81232f7bc4a7351c9  upmpdcli-0.12.0.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.13.1.tar.gz.sha256
+sha256 86f964e49b0288a4d660aa4ad83576d83aad7c354df67d3aa8e324e8912876e0  upmpdcli-0.13.1.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 74413ae..ba5bbb2 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.12.0
+UPMPDCLI_VERSION = 0.13.1
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.6.4
