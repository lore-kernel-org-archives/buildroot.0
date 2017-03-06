From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:22:35 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.4.0
Message-ID: <20170306202254.BF667822CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81f55e43094eed1000fa836db7a36151e89356cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 1ea4103..2bcd5e2 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	b2f6ba7c6e7145409d698674a4fc883aa16b8b6a2265eacbb80720fe0a0b2603	cjson-v1.3.2.tar.gz
+sha256	8e1c389627c6275344000e063f2f3d8cb0c1354ca75cf95855e286f173d3bfb5	cjson-v1.4.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index b403a1d..4937821 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.3.2
+CJSON_VERSION = v1.4.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
