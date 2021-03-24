From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 24 Mar 2021 13:34:08 +0100
Subject: [Buildroot] [PATCH 3/4] package/sysrepo: bump version to 1.4.122
In-Reply-To: <20210324123407.23006-1-heiko.thiery@gmail.com>
References: <20210324123407.23006-1-heiko.thiery@gmail.com>
Message-ID: <20210324123407.23006-3-heiko.thiery@gmail.com>
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
index d0b3c82ad3..693a2bbf7d 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  635f68ad5f8cb5ea3bd7c3081963f1a9a79ee0d6570facb1f3bcbf3b640446a4  sysrepo-1.4.104.tar.gz
+sha256  2cc7537a03f48dc3c955436e1e0ed077bc3b31a755d6979d24ca42e1187fce01  sysrepo-1.4.122.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index e4d553cdbd..dbc7b16b63 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.104
+SYSREPO_VERSION = 1.4.122
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
-- 
2.30.0
