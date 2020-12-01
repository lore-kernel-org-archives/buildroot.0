From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:24:33 +0100
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-tls: bump
 version to 1.1.9
Message-ID: <20201201221510.0AA348113D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5dcddf4521b37e597828cac6ac5b863ad3dbf1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The license file hash has changed due to:

-Copyright 2002-2019 ProcessOne SARL
+Copyright 2002-2020 ProcessOne SARL

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 135a5368d1..475223b986 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6444e174650054a53624490155a914b8bea31cdefbcd5f87fc1862102dc1db6e erlang-p1-tls-1.1.2.tar.gz
-sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
+sha256  97fd0a398751fc63b28df016e92a08ea98d083f7d5e3f32380a92de1ee86ca0e  erlang-p1-tls-1.1.9.tar.gz
+sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 824fe41ec1..9e7d4c7c73 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.2
+ERLANG_P1_TLS_VERSION = 1.1.9
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
