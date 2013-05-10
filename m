From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:32 +0200
Subject: [Buildroot] [PATCH 10/16] netatalk: handle netatalk-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/netatalk.mk |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.9.5
