From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Mar 2021 23:39:20 +0100
Subject: [Buildroot] [PATCH v1] package/cjson: bump version to 1.7.14
Message-ID: <20210313223920.27266-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog ([1]):

  1.7.14 (Sep 3, 2020)
  Fixes:
    optimize the way to find tail node, see #503
    Fix WError error on macosx because NAN is a float. Thanks @sappo, see #484
    Fix some bugs in detach and replace. Thanks @miaoerduo, see #456

[1] https://github.com/DaveGamble/cJSON/blob/master/CHANGELOG.md

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index b99fcee8ba..5133c15a4f 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d4e77a38f540f2c37f55758f2666655314f1f51c716fea5f279659940efdcf04  cjson-1.7.13.tar.gz
+sha256  fb50a663eefdc76bafa80c82bc045af13b1363e8f45cec8b442007aef6a41343  cjson-1.7.14.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 47f8ecfd15..daa498f9ff 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.13
+CJSON_VERSION = 1.7.14
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.30.1
