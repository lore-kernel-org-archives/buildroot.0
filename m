From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 20:58:24 +0200
Subject: [Buildroot] [git commit] monit: bump to version 5.24.0
Message-ID: <20171002185457.7431680FF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe945e6c23d1140dddf2de51ec5c53764c1b127d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monit/monit.hash | 4 ++--
 package/monit/monit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index d20286c..611d3e1 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,2 @@
-# From https://mmonit.com/monit/dist/monit-5.23.0.tar.gz.sha256:
-sha256  dd39fe3a379c02402ba9c44c201b3ba925ebdc8f04225918820607b6c5d56713  monit-5.23.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.24.0.tar.gz.sha256:
+sha256  754d1f0e165e5a26d4639a6a83f44ccf839e381f2622e0946d5302fa1f2d2414  monit-5.24.0.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 32cef1e..260bb5b 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.23.0
+MONIT_VERSION = 5.24.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
