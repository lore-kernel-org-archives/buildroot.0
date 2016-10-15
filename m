From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:16:03 +0200
Subject: [Buildroot] [git commit] package/monolite: bump to version 149
Message-ID: <20161015092257.57F0181EF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d882a232c4cc2100bd18e994f0861cd614efabff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps monolite to version 149

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 44ec39a..621e5e4 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 885270da1b64670bffec9c8df1272ab88ff0b96186d2ebb61bdfa47a5586f987  monolite-140-latest.tar.gz
+sha256 c01e9ba37d8d8f9ef68e08170b2582cc710a8a77756e2412dff298a39b3c4d2b  monolite-149-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 91c01d7..d50d9f2 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 140
+MONOLITE_VERSION = 149
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
