From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Mar 2011 08:58:54 +0100
Subject: [Buildroot] [git commit master 1/1] avahi: bump version
Message-ID: <20110309075920.575AF8F439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=034b92c6855a917b99d1e37b1f5cdaefd3c4a594
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mainly bugfixes.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 13ae85f..dc04869 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.28
+AVAHI_VERSION = 0.6.29
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
-- 
1.7.3.4
