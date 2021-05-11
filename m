From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 22:02:34 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.5.12
Message-ID: <20210511193512.697977FB93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aded85d38105d682b0bbf84187b40ee275b7ed30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 20166e44e3..f585a73d7f 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.11.tar.gz.sha256:
-sha256  7c8c6ab866114699405223c60457448dcce35fc13e1e374f68b60eefc55f4f04  upmpdcli-1.5.11.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.12.tar.gz.sha256:
+sha256  1d7b6ab360c2549a7e3eff4f261471761dd837e18327a3ca29de1981c090ff3b  upmpdcli-1.5.12.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 9d3e41881f..d1c0aef912 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.5.11
+UPMPDCLI_VERSION = 1.5.12
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
