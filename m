From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:00:29 +0100
Subject: [Buildroot] [git commit] package/reaver: bump to version 1.6.5
Message-ID: <20190309135808.7774D8E5B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8c2954649fc55fbc41b2ed5bb74ab7c0cdcb044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/reaver/reaver.hash | 2 +-
 package/reaver/reaver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
index 6d2baccdce..9a75215282 100644
--- a/package/reaver/reaver.hash
+++ b/package/reaver/reaver.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 350a89b068f8b461e6459b739d4f5f301db01f115d75f4d698a1f2830149c412 reaver-9bae55bd30b6d46b42da3a09dc23c8b0f9341996.tar.gz
+sha256 e6761d2d4ef9cb2b45fe0a60d6b94048ce4442e4ac209904fe89506ff1e94c44 reaver-v1.6.5.tar.gz
 sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index d9a621a847..328a5c76a3 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -6,7 +6,7 @@
 
 # Older repos for this project will not cross-compile easily
 #??while this one works right away
-REAVER_VERSION = 9bae55bd30b6d46b42da3a09dc23c8b0f9341996
+REAVER_VERSION = v1.6.5
 REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
 REAVER_LICENSE = GPL-2.0+
 REAVER_LICENSE_FILES = docs/LICENSE
