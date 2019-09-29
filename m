From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 18:44:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftp: bump version to 4.10
Message-ID: <20190929164436.14127-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index a1bdf5b538..1497430011 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256	2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a	uftp-4.9.11.tar.gz
+sha256	91ba8aae80c7c9ccaf04600b628cbeca4699ed48268fe43d2bf539a41083f292	uftp-4.10.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index f217cf3ac8..cfef1f9e32 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 4.9.11
+UFTP_VERSION = 4.10
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
