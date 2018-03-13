From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:14:56 +0100
Subject: [Buildroot] [git commit] luarocks: bump to version 2.4.4
Message-ID: <20180313211611.431CF8079B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b68c83282bc6abe6781b7c79f7d8f228f12978e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 27845a46c4..7c3f96606f 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4d414d32fed5bb121c72d3ff1280b7f2dc9027a9bc012e41dfbffd5b519b362e  luarocks-2.4.3.tar.gz
+sha256 3938df33de33752ff2c526e604410af3dceb4b7ff06a770bc4a240de80a1f934  luarocks-2.4.4.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index e050cb553c..389d521832 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.3
+LUAROCKS_VERSION = 2.4.4
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
