From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:10:42 +0100
Subject: [Buildroot] [git commit branch/next] luarocks: bump to version 2.4.2
Message-ID: <20161130211427.12C7080265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b022d9301f999481ac26af7d8074002be5d49705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index c35383a..fb01993 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e429e0af9764bfd5cb640cac40f9d4ed1023fa17c052dff82ed0a41c05f3dcf9  luarocks-2.4.1.tar.gz
+sha256	0e1ec34583e1b265e0fbafb64c8bd348705ad403fe85967fd05d3a659f74d2e5  luarocks-2.4.2.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 64c8d5b..4e0d537 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.1
+LUAROCKS_VERSION = 2.4.2
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
