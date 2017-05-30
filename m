From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:51:56 +0200
Subject: [Buildroot] [PATCH 01/16] erlang-goldrush: bump version to 0.1.9
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-2-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-goldrush/erlang-goldrush.hash | 2 +-
 package/erlang-goldrush/erlang-goldrush.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
index 00ccb43ca6..d575aa49b2 100644
--- a/package/erlang-goldrush/erlang-goldrush.hash
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 739d8ce15049c54f7e00528edbf536f63a24fdb9dfa053d176e6f97a9832b834 erlang-goldrush-0.1.8.tar.gz
+sha256 6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612 erlang-goldrush-0.1.9.tar.gz
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index 2fa88107e1..e95b09cd86 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_GOLDRUSH_VERSION = 0.1.8
+ERLANG_GOLDRUSH_VERSION = 0.1.9
 ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
 ERLANG_GOLDRUSH_LICENSE = ISC
 ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
-- 
2.11.0
