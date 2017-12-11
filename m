From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 19:57:55 +0100
Subject: [Buildroot] [git commit] libostree: depend on host-bison
Message-ID: <20171211185347.3B073800B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce0511a892721b0af4d64115d6b53a00d527fd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9179b65a5a90d53490d9e109c45341f1104406a3

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 3ac8278..cddde37 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -10,7 +10,7 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
-LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
+LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
 
 LIBOSTREE_CONF_OPTS += \
