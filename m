From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:50:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libevent: set LIBEVENT_CPE_ID_VALID
Message-ID: <20210305095054.1833177-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libevent_project:libevent is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibevent_project%3Alibevent

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libevent/libevent.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 5d02191a58..1e34094e25 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -10,6 +10,7 @@ LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
+LIBEVENT_CPE_ID_VALID = YES
 LIBEVENT_CONF_OPTS = \
 	--disable-libevent-regress \
 	--disable-samples
-- 
2.30.0
