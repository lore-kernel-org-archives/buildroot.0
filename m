From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:03:31 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.1.3
Message-ID: <20160318210641.97A5B8014B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50ac56894b89af9cef1de8cb323e25e272773f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index fac3f66..27a75cc 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.2.tar.gz.sha256
-sha256  4866a4a5c54f8e3355ca7337860b998e1c8c562a7d26c4d8ae72eefdf9279982  upmpdcli-1.1.2.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.3.tar.gz.sha256
+sha256  2df3e6593f18c097b6247fb8da919b94701bf083b219056b006d68e6dcef75b5  upmpdcli-1.1.3.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 3c51880..1a7c790 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.1.2
+UPMPDCLI_VERSION = 1.1.3
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
