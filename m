From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:29 +0200
Subject: [Buildroot] [PATCH 2/6] package/lldpd: remove --without-json
In-Reply-To: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
References: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407195833.9275-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

json option has been removed in version 0.9.7 with
https://github.com/vincentbernat/lldpd/commit/06987a24ce053cbb57f8853bbf544bc7c067c8aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/lldpd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 8d554ae5e2..506b6f136d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -31,7 +31,6 @@ LLDPD_CONF_OPTS = \
 	--without-embedded-libevent \
 	--without-snmp \
 	--without-xml \
-	--without-json \
 	--without-seccomp \
 	--without-libbsd \
 	--disable-hardening \
-- 
2.20.1
