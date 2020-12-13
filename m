From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 17:42:09 +0100
Subject: [Buildroot] [PATCH 3/3] package/upmpdcli: bump to version 1.5.5
In-Reply-To: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
References: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213164209.940947-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#UPMPDCLI-1.5.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 68ea707e53..b24aec9834 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.14.tar.gz.sha256:
-sha256  e3d90dedee6a942acc049324ca81b7f008d217d386a3e2590a2ca5670cc9df05  upmpdcli-1.4.14.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.5.tar.gz.sha256:
+sha256  45fce9c71a45f1ec0d1cb2924bf7ece444c44a918a0c437c1c768baa3d4a345d  upmpdcli-1.5.5.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 6531b90ee9..a987806725 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.14
+UPMPDCLI_VERSION = 1.5.5
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.29.2
