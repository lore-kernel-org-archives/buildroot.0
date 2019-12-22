From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:38:42 +0100
Subject: [Buildroot] [git commit] package/rygel: drop autoreconf
Message-ID: <20191222102943.4A94B8D512@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d2c4081f0c07f30e648c74513165a814781c9c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoreconf is not needed since bump to version 0.36.2 in commit
76f86c409d016851d4d63216ada969e6cd81dd56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rygel/rygel.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 5ffb6a9400..d87beda8c9 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -17,8 +17,6 @@ RYGEL_DEPENDENCIES = \
 	sqlite \
 	$(TARGET_NLS_DEPENDENCIES)
 RYGEL_INSTALL_STAGING = YES
-# We're patching configure.ac
-RYGEL_AUTORECONF = YES
 
 RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
