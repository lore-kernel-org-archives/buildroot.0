From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:15 +0200
Subject: [Buildroot] [git commit] package/acpica: bump version to 20170303
Message-ID: <20170426072113.436B68280F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe176da86912220402c8fb47db3e3c9c780d98a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 71c110b..d69279e 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 dfb33db5599bd48134dbd6e50c8804099be0cf1c35d98975a6cb84dabca78b67 acpica-unix2-20161117.tar.gz
+sha256 b2d81e84107ac9a02be86ea43cbea7afa8fd4b4150270bc88c2d4c9fea0b8aad acpica-unix2-20170303.tar.gz
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index ebfa4b6..37e4941 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20161117
+ACPICA_VERSION = 20170303
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
