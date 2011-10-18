From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 11:14:55 -0300
Subject: [Buildroot] [PATCH 2/2] stunnel: add mirror site
In-Reply-To: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318947295-24677-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stunnel is known to move all but the latest version to an obsolete
directory when there's a new release, as pointed out by Maxime Ripard.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 6088e58..c5ea152 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -6,6 +6,7 @@
 
 STUNNEL_VERSION = 4.44
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
+STUNNEL_MIRROR = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT += \
 	--with-ssl=$(STAGING_DIR)/usr \
-- 
1.7.3.4
