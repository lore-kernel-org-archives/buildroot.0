From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 11 May 2020 21:56:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/sysrepo: bump version to 1.4.58
In-Reply-To: <20200511195649.10398-1-heiko.thiery@gmail.com>
References: <20200511195649.10398-1-heiko.thiery@gmail.com>
Message-ID: <20200511195649.10398-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index a759821614..ae72fc2b00 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d84d4f092feab83b0a39fef5d0d62bc6ed1f0f8aa274329f2cbf0a95a6528d8a  sysrepo-1.4.2.tar.gz
+sha256  9c134658a5b812cd86b9113c30fc01be5a094616f473e747032ccf614af9e4dd  sysrepo-1.4.58.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 67290dad4f..aee40fa274 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.2
+SYSREPO_VERSION = 1.4.58
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
-- 
2.20.1
