From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:44 -0500
Subject: [Buildroot] [PATCH 23/25] package/rp-pppoe: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-23-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rp-pppoe_project:rp-pppoe:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:rp-pppoe_project:rp-pppoe

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rp-pppoe/rp-pppoe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 2f0073b6c0..9f68a6a2fc 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -15,6 +15,7 @@ RP_PPPOE_TARGET_SCRIPTS = pppoe-connect pppoe-init pppoe-setup pppoe-start \
 	pppoe-status pppoe-stop
 RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
 RP_PPPOE_CONF_OPTS = --disable-debugging
+RP_PPPOE_CPE_ID_VENDOR = rp-pppoe_project
 
 # The pppd, echo, setsid and id paths must be the ones on the
 # target. Indeed, the result of these checks is used to replace
-- 
2.17.1
