From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Apr 2011 15:44:35 +0200
Subject: [Buildroot] [git commit] avahi: bump version
Message-ID: <20110404134731.8A30581ED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01931cc26499e5003582a7bc52f489019e706d4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index dc04869..4dfa354 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.29
+AVAHI_VERSION = 0.6.30
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
-- 
1.7.3.4
