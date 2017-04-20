From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:12:56 +0200
Subject: [Buildroot] [git commit] cjson: bump version to v1.4.7
Message-ID: <20170420211316.02031827F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da0cc47c6f6e74807598f0e27e0b9253fc764b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index a8e855a..da6a8fc 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 7db3981015a4168a186c2f554842bd7abb8d1c969f081e8d4208e36fb260059a  cjson-v1.4.6.tar.gz
+sha256 d320a180be80726d13b399b17dcaf226484dc362a8d7a1c6a9a9e3bd8eb184fd  cjson-v1.4.7.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index f2f2925..779cd3b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.6
+CJSON_VERSION = v1.4.7
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
