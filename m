From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:10:54 +0100
Subject: [Buildroot] [PATCH 01/22] erlang-p1-utils: Bump to version 1.0.16
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-2-johan.oudinet@gmail.com>
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
index db925bddd1..cd26340e12 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8f21fc0472c314572ebb066d624cb5463cf5b016e18b7fd7dca9dca2a4589382 erlang-p1-utils-1.0.13.tar.gz
+sha256 2559967770558dc003bcc3c7efc216f6c57c4f23830d5de33c6bf61d8a3f880c erlang-p1-utils-1.0.16.tar.gz
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 6025e3f56c..5375971d39 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.13
+ERLANG_P1_UTILS_VERSION = 1.0.16
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
