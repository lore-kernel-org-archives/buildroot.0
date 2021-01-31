From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 11:29:45 +0100
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.18
Message-ID: <20210131101052.1CA77815B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92bb7938ab3b0f6004137739b01befc3a4aee189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 7105fbe7da..192032e6db 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2020-August/009814.html
-sha256  b5eb8556dea1b0cad4167a66223522e66d670ec1eba16c7fdc844ed6b652572e  xapian-core-1.4.17.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2021-January/009856.html
+sha256  196ddbb4ad10450100f0991a599e4ed944cbad92e4a6fe813be6dce160244b77  xapian-core-1.4.18.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 1a8557d603..4f40babcf9 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.17
+XAPIAN_VERSION = 1.4.18
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
