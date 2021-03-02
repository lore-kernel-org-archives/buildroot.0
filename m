From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 15:15:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: add CPE
 variables
Message-ID: <20210302141504.365668-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:dovecot:pigeonhole is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adovecot%3Apigeonhole

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 5c4cdb633e..b65e388a06 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -9,6 +9,8 @@ DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION)
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
+DOVECOT_PIGEONHOLE_CPE_ID_VENDOR = dovecot
+DOVECOT_PIGEONHOLE_CPE_ID_PRODUCT = pigeonhole
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
 DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
-- 
2.30.0
