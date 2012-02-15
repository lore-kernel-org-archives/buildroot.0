From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 Feb 2012 08:41:05 +0100
Subject: [Buildroot] [git commit branch/next] avahi: bump version
Message-ID: <20120215222628.4E39D90AAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68f651954705e3f90ede5b3fb647ccdb6c9226bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 739c5f2..3392614 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.30
+AVAHI_VERSION = 0.6.31
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
