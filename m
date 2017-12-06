From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:02:39 +0100
Subject: [Buildroot] [git commit] poco: bump to version 1.8.0.1
Message-ID: <20171206215524.4CF8582873@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a6b085c10a894076b8045e38f72d0358b4572b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/poco.hash | 3 ++-
 package/poco/poco.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 7f96f04..d92645f 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  150b8d8486fbd01f4bbe359a56439ccf14b62fb9994991baa9663a2656acee27  poco-poco-1.7.9-release.tar.gz
+sha256  ae87222c674ff5cb1318253d19a72348e385f2a4db4b05329d712361303578f5  poco-poco-1.8.0.1-release.tar.gz
+sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 29752e2..89b9791 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.7.9-release
+POCO_VERSION = poco-1.8.0.1-release
 POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
