From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Sep 2016 17:01:16 +0200
Subject: [Buildroot] [git commit] luarocks: bump to version 2.4.0
Message-ID: <20160909150500.B538F82272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e85e9b478b382a4c3aee64c3bb1d7055aabac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 4d9840a..2750745 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	68e38feeb66052e29ad1935a71b875194ed8b9c67c2223af5f4d4e3e2464ed97  luarocks-2.3.0.tar.gz
+sha256	44381c9128d036247d428531291d1ff9405ae1daa238581d3c15f96d899497c3  luarocks-2.4.0.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index eddd435..4a5ae03 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.3.0
+LUAROCKS_VERSION = 2.4.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
