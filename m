From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:39:21 +0200
Subject: [Buildroot] [git commit] netatalk: add license info
Message-ID: <20131008204238.A195A9B989@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa4e3d5e602beb776037f94a6b9efcf74c3a0632
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 5dab57d..2bd63ec 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -11,6 +11,8 @@ NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
+NETATALK_LICENSE = GPLv2+, LGPLv3+, MIT-like
+NETATALK_LICENSE_FILES = COPYING COPYRIGHT
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
