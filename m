From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:31:19 +0200
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.4.0
Message-ID: <20200926133109.2A64F89169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06140ef93d59d48566f539e3274bae724415af1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.hash | 4 ++--
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 069d181d61..565b1cccfa 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 eb20cd9814df05535d9aae98da532217c590fc07d48d90ca237e2a7cdcf284fe  luarocks-3.3.1.tar.gz
-sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
+sha256  62ce5826f0eeeb760d884ea8330cd1552b5d432138b8bade0fa72f35badd02d0  luarocks-3.4.0.tar.gz
+sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 14f05b3498..00b3e17cb5 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.3.1
+LUAROCKS_VERSION = 3.4.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
