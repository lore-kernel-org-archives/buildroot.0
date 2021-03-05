From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 14:00:11 +0100
Subject: [Buildroot] [git commit] package/libevent: set LIBEVENT_CPE_ID_VALID
Message-ID: <20210305123920.2E7E6812C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88772b90fb61a16774ac8e63e0a6627c7b86ba27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libevent_project:libevent is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibevent_project%3Alibevent

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
