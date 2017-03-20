From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:56:29 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.4.3
Message-ID: <20170320205727.173798257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a521a33799c1ed706a4c0ef915fdd0eccf645937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 03d6d36..39ca2cb 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	6bb0cec66f877f694ffd0e6026b33da1df28a204a9d3a65fbe5055d038a3e8bf	cjson-v1.4.2.tar.gz
+sha256	3b362a6af73e10b0361119bc9fa9569578f9daa486cb487cad79322a34cd6965	cjson-v1.4.3.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 6403c18..6872b10 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.2
+CJSON_VERSION = v1.4.3
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
