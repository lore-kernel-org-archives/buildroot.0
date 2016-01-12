From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 22:26:53 +0100
Subject: [Buildroot] [git commit] luarocks: bump to version 2.3.0
Message-ID: <20160112214906.C1EEB82751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf903fa515638c14368f45c5e275aedb3103b64b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add .hash file]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.hash | 2 ++
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
new file mode 100644
index 0000000..4d9840a
--- /dev/null
+++ b/package/luarocks/luarocks.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	68e38feeb66052e29ad1935a71b875194ed8b9c67c2223af5f4d4e3e2464ed97  luarocks-2.3.0.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index ccbaaf7..656b832 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.2.2
+LUAROCKS_VERSION = 2.3.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
