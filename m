From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Sep 2014 22:55:49 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump to version 0.10.32
Message-ID: <20140917205752.D2C289D6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a29129201b961747f0d4cd87b9c2f959ae79ca77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ba425bb..1fe6dd7 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.31
+NODEJS_VERSION = 0.10.32
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
