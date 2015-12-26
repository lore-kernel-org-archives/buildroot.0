From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:15:35 +0100
Subject: [Buildroot] [git commit] package/upmpcli: bump to version 0.13.1
Message-ID: <20151226151542.E51BF81E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6bb06bcfa456f0002b46a8a6367234986882070
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upmpdcli version 0.13.1 requires libupnpp version 0.13.1 to build successfully.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
