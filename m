From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:36 +0100
Subject: [Buildroot] [PATCH 01/14] erlang-lager: Bump to version 3.4.2
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-2-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change repository from basho to erlang-lager.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-lager/erlang-lager.hash | 2 +-
 package/erlang-lager/erlang-lager.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 97bf4c64ba..144cef6d3d 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5ef0f65e0c18a7df5c5f2cd8e96780396f13369127d87857e7931670c79a9327 erlang-lager-3.2.1.tar.gz
+sha256 c5f532dd236e07dad27976abcf12b9c90fcf33ffd6fe1b1d34639c06171c36ea erlang-lager-3.4.2.tar.gz
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index 208ccf1611..790288a460 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.2.1
-ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
+ERLANG_LAGER_VERSION = 3.4.2
+ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
 ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
-- 
2.14.1
