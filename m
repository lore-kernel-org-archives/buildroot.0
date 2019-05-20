From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 21 May 2019 00:40:37 +0300
Subject: [Buildroot] [PATCH/next v2 3/3] package/cog: bump version to 0.3.0
In-Reply-To: <20190520214037.58011-1-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190520214037.58011-1-aperez@igalia.com>
Message-ID: <20190520214037.58011-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.2.0 does not work with WPE WebKit 2.22.x, this is the
first version which can be used with 2.24.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - No changes.

---
 package/cog/cog.hash | 2 +-
 package/cog/cog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 97daf72744..39cf2afdbd 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256 a6abadb78395226bac2e1dd5467feab2cc8c493eab6894a09a51a8e072e38c06  cog-v0.2.0.tar.gz
+sha256 755c68029bbd05a17784262e56021362740783d15868dab9402a125ef35eedaf  cog-v0.3.0.tar.gz
 
 # Hashes for license files:
 sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 44ea62185d..b56a772a25 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = v0.2.0
+COG_VERSION = v0.3.0
 COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
 COG_INSTALL_STAGING = YES
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
-- 
2.21.0
