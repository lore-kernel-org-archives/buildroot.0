From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:40 +0200
Subject: [Buildroot] [git commit branch/next] netatalk: handle
	netatalk-config script
Message-ID: <20130511204539.9EE709A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b0542d46254fd1c9966e783f5c56bd468f05e16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/netatalk.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 243d3f7..a366644 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -8,6 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
 NETATALK_AUTORECONF = YES
+NETATALK_CONFIG_SCRIPTS = netatalk-config
 
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
