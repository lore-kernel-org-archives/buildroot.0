From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:48 +0100
Subject: [Buildroot] [PATCH 05/18] package/erlang-p1-tls: bump version to
 1.1.9
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-5-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 135a5368d1..2617b1249d 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6444e174650054a53624490155a914b8bea31cdefbcd5f87fc1862102dc1db6e erlang-p1-tls-1.1.2.tar.gz
-sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
+sha256  97fd0a398751fc63b28df016e92a08ea98d083f7d5e3f32380a92de1ee86ca0e  erlang-p1-tls-1.1.9.tar.gz
+sha256  6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847  LICENSE.txt
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
-- 
2.25.1
