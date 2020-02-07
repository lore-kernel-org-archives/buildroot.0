From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 16:53:20 +0100
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.3.1
Message-ID: <20200207154240.DED1B8D4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d004460fe8ff30ec616126ef206997c8347f412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index f001729170..069d181d61 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8de54eb851f5245ed3708d94d8872e825b9704049d3ad4febe8e219f419b427d  luarocks-3.3.0.tar.gz
+sha256 eb20cd9814df05535d9aae98da532217c590fc07d48d90ca237e2a7cdcf284fe  luarocks-3.3.1.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 84b3fe4387..123f8c0734 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.3.0
+LUAROCKS_VERSION = 3.3.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
