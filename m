From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 23:00:12 +0200
Subject: [Buildroot] [git commit] cjson: bump version to v1.4.6
Message-ID: <20170412210016.5B80B8275D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5380e6996f2a23c00de7217e27cd22c2efe3f76b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 2e38a8b..a8e855a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 3d0a61f2023749a6b813cadc713234a2ea393cf5482d910cf91584f13a82af13  cjson-v1.4.5.tar.gz
+sha256 7db3981015a4168a186c2f554842bd7abb8d1c969f081e8d4208e36fb260059a  cjson-v1.4.6.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 55417d1..f2f2925 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.5
+CJSON_VERSION = v1.4.6
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
