From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:07:54 +0100
Subject: [Buildroot] [PATCH 02/15] erlang-p1-utils: Bump to version 1.0.13
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-3-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index 950a5540d7..db925bddd1 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 57bfc575179733a723717f4fecb65b9f7fd056595f798b52e7bc0206e8a9333f erlang-p1-utils-1.0.10.tar.gz
+sha256 8f21fc0472c314572ebb066d624cb5463cf5b016e18b7fd7dca9dca2a4589382 erlang-p1-utils-1.0.13.tar.gz
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 6a4920738c..6025e3f56c 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.10
+ERLANG_P1_UTILS_VERSION = 1.0.13
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
