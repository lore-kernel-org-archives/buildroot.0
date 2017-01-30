From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 14:12:18 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.2.12
Message-ID: <20170130131409.A112781DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a59c15208719c6656b5c9860546a48fb2c24a6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 0f9e408..bcd7831 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Manually calculated:
-sha256  a925dac1721fe002c16ed3c9e2de0370c2fe6c1e6f4f97a7551f20c6226cc0e2  upmpdcli-1.2.10.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.12.tar.gz.sha256:
+sha256  20d97c2e5ff6911e1e1538edb1487823479802cba6bd4f4c4a74035edf61cb26  upmpdcli-1.2.12.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index d1d6ab4..83efa05 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.10
+UPMPDCLI_VERSION = 1.2.12
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
