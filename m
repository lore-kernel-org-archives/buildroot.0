From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:51:58 +0200
Subject: [Buildroot] [PATCH 03/16] erlang-p1-utils: bump to version 1.0.8
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-4-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index c41e5ef525..200d102450 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9c7e9fa2990edd419953a6ae609ffed0b90e671b57c468d97c0d85d866d80210 erlang-p1-utils-1.0.3.tar.gz
+sha256 9b43e025b923221cfe6a6efc76790d97b1c233e3e2db37fc804294d847bcfaa3 erlang-p1-utils-1.0.8.tar.gz
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index c9d9299443..32564cf89f 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.3
+ERLANG_P1_UTILS_VERSION = 1.0.8
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
-ERLANG_P1_UTILS_LICENSE = GPL-2.0+
+ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_UTILS_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
2.11.0
