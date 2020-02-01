From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2020 15:59:46 +0100
Subject: [Buildroot] [git commit] package/libhtp: bump to version 0.5.32
Message-ID: <20200201145158.7F0AB87FCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20894d60a5620938bc349e0b9cc881428c67359f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index cd21641f59..b3775c3ad3 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	ce16a3e57c7d1f1e8255a4f698e22ddd33c15fb4e737ab90b04c9a1f07e48780	libhtp-0.5.31.tar.gz
+sha256	a6a6f3b3f1fb6e8b8a1dae02db8a0090c438f0d057102dd8e52208224868c4e4	libhtp-0.5.32.tar.gz
 sha256	87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15	LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 9a3cda6162..577b700953 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.31
+LIBHTP_VERSION = 0.5.32
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
