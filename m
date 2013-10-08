From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  8 Oct 2013 21:02:31 +0200
Subject: [Buildroot] [PATCH 1/3] netatalk: add license info
Message-ID: <1381258953-13487-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netatalk/netatalk.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.4.rc3
