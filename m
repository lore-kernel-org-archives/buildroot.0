From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2020 17:17:23 +0100
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.3.0
Message-ID: <20200129160718.4BC46842EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db78559f6a65a0ecd44e4321a69f86c63447e618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 3bcd22fbe6..f001729170 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f27e20c9cdb3ffb991ccdb85796c36a0690566676f8e1a59b0d0ee6598907d04  luarocks-3.2.1.tar.gz
+sha256 8de54eb851f5245ed3708d94d8872e825b9704049d3ad4febe8e219f419b427d  luarocks-3.3.0.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cd547e280b..84b3fe4387 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.2.1
+LUAROCKS_VERSION = 3.3.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
