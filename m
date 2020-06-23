From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 22:31:26 +0200
Subject: [Buildroot] [PATCH v2, 3/3] package/upmpdcli: bump to version 1.4.12
In-Reply-To: <20200623203126.1024202-1-fontaine.fabrice@gmail.com>
References: <20200623203126.1024202-1-fontaine.fabrice@gmail.com>
Message-ID: <20200623203126.1024202-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 6eb6c7b9ea..83fb5cf967 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.9.tar.gz.sha256:
-sha256  ace5a3166891109d2a874f21306986857ee2620230a77751ed6209f7b5cc9c58  upmpdcli-1.4.9.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.12.tar.gz.sha256:
+sha256  bffc78c140ad688987894ea5a1e162e6dcbc7dcae7d2cc322a894f5ea2a2f53b  upmpdcli-1.4.12.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index ab4b8bfd3c..1315022ee8 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.9
+UPMPDCLI_VERSION = 1.4.12
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.26.2
