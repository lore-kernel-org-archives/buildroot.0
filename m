From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 22:35:59 +0200
Subject: [Buildroot] [git commit] package/cgilua: bump to version 6.0.2
Message-ID: <20210423200938.9C8C383D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3176c9657ee5d728950f72735ce07094f0a21d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the HTML license file has changed due to changes in the
HTML menu and other parts of the page that don't change the license
text itself.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cgilua/cgilua.hash | 4 ++--
 package/cgilua/cgilua.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index 8bdb1d18f1..385382b9d5 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 7d4883e6a89b3463a1d35b8084a6e2afbbb584af7aca1169380e92af0f848413  cgilua-5.2.1-1.src.rock
-sha256 0cf6f0858b0fd90bb5705c8ace77a8afd11e8fce1427fe0a48156937222b8c28  cgilua-5.2.1/doc/us/license.html
+sha256 7bfb88c483136bca9b814316d7f9ff581a805d68d144c1eebdfda3e8dfb5eb3a  cgilua-6.0.2-0.src.rock
+sha256 b82f9b13f9b1a1387f53203a625612914630b520377731b0aab7ce93ad2b18c4  cgilua/doc/us/license.html
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index cd78841fdb..7471be3da0 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.2.1-1
+CGILUA_VERSION = 6.0.2-0
+CGILUA_SUBDIR = cgilua
 CGILUA_LICENSE = MIT
 CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
 
