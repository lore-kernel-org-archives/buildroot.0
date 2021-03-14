From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 17:59:50 +0100
Subject: [Buildroot] [git commit] package/libubox: bump version to 551d75b
Message-ID: <20210314163704.2EA8A87765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cd0a13cfc61a031a6f715600a3348822ff63124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  2e52c7e libubox: fix BLOBMSG_CAST_INT64 (do not override BLOBMSG_TYPE_DOUBLE)
  870acee tests: cram: test_base64: fix failing tests
  4d8995e tests: cram: test_base64: really fix failing tests
  551d75b libubox: tests: add more blobmsg/json test cases

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index fd4c5a4a39..94a071d80d 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e383caf80a241e9711ab0c58a5e8f4d16479693be1e44ffb6cc716a185e7e303  libubox-5bc0146a1d6474d339c4ade9a227f32cc27a8b93-br1.tar.gz
+sha256  c6bac8baa7525b2d35eb22edeb5722c098370794d00e8859ef1a0bdfd8716151  libubox-551d75b5662cccd0466b990d58136bdf799a804d-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 4626659158..20da5c2ec2 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 5bc0146a1d6474d339c4ade9a227f32cc27a8b93
+LIBUBOX_VERSION = 551d75b5662cccd0466b990d58136bdf799a804d
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
