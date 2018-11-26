From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:07:56 +0100
Subject: [Buildroot] [PATCH 04/15] erlang-p1-tls: Bump to version 1.0.25
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-5-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index b5b800b202..af635e5221 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ca9670b7f78a025b101e3fee6255d7472d6b52abc46444cc45616c3d1bd75b9b erlang-p1-tls-1.0.17.tar.gz
+sha256 5bb883b03514999876c750cdb08a5e4cf80a9eb89319037b612e1265c43f6f6d erlang-p1-tls-1.0.25.tar.gz
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index ad7317dc8c..b569664465 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.0.17
+ERLANG_P1_TLS_VERSION = 1.0.25
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
