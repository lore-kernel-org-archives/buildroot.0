From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:51:57 +0200
Subject: [Buildroot] [PATCH 02/16] erlang-lager: bump to version 3.2.1
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-3-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-lager/erlang-lager.hash | 2 +-
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index e436fdc7d5..97bf4c64ba 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 168a8e48646b04bcee1ab0c97c1ff63563bd7fd25638f1504b8d8f674d2ddd1b erlang-lager-2.2.0.tar.gz
+sha256 5ef0f65e0c18a7df5c5f2cd8e96780396f13369127d87857e7931670c79a9327 erlang-lager-3.2.1.tar.gz
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index b55b6f7b78..208ccf1611 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 2.2.0
+ERLANG_LAGER_VERSION = 3.2.1
 ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
-- 
2.11.0
