From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:47:17 +0200
Subject: [Buildroot] [git commit] package/sysrepo: bump version to 1.4.122
Message-ID: <20210328202237.6A5878A49E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=589e2d96dc9e09b8b9c413cb9c6d68c925e98a58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
