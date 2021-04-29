From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:13:22 +0200
Subject: [Buildroot] [git commit] package/solarus: bump to version 1.6.5
Message-ID: <20210429084946.6001684197@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=696d2dbcda26c8411ddaf7811b0b2890fe4ce431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.solarus-games.org/en/news/2021-04-06-solarus-1-6-5-bugfix-release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/solarus/solarus.hash | 2 +-
 package/solarus/solarus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index 8400bfd135..6e1200b19c 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b2e00a7df8953903ba022a8f392038e86f675cee714da19cf9a5f8535c42f349  solarus-v1.6.4.tar.bz2
+sha256  4b4ac59df8ab63ee2e305cbf48118d6be0cf9665968eb0b06dd1acdf4346516f  solarus-v1.6.5.tar.bz2
 
 sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 92e849ef02..90cbf3e784 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOLARUS_VERSION = 1.6.4
+SOLARUS_VERSION = 1.6.5
 SOLARUS_SITE = \
 	https://gitlab.com/solarus-games/solarus/-/archive/v$(SOLARUS_VERSION)
 SOLARUS_SOURCE = solarus-v$(SOLARUS_VERSION).tar.bz2
