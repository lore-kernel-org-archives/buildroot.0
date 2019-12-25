From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:27:00 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/rygel: drop
 autoreconf
Message-ID: <20191225211821.465748E455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d34dea2de9e13e4019b08b4f9f231ed42afd3797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

autoreconf is not needed since bump to version 0.36.2 in commit
76f86c409d016851d4d63216ada969e6cd81dd56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1d2c4081f0c07f30e648c74513165a814781c9c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rygel/rygel.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 1bf3ab4350..de5cacd120 100644
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
