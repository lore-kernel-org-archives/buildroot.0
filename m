From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 20:13:20 +0100
Subject: [Buildroot] [git commit] package/znc: bump version to 1.7.2
Message-ID: <20190127193759.F29E8812FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77dacbb0d83f8d68a527da46dd9ca2c5bf2264c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 7a14595907..0845df5355 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 44cfea7158ea05dc2547c7c6bc22371e66c869def90351de0ab90a9c200d39c4  znc-1.7.1.tar.gz
+sha256 60b4e78f54c532c32673d1ef8e5f606c530ef3a6d6b76ea1daa66459a86682a9  znc-1.7.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 5235fd9196..b2e422c0f0 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.7.1
+ZNC_VERSION = 1.7.2
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
