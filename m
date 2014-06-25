From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:32:55 +0200
Subject: [Buildroot] [git commit] irda-utils: add license information
Message-ID: <20140625211213.99C889D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5b7d145c84dfaa45e281683e22763aa2c8f9412
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irda-utils/irda-utils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 4be80d7..e4958e5 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -6,6 +6,8 @@
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
+IRDA_UTILS_LICENSE = GPLv2+
+IRDA_UTILS_LICENSE_FILES = man/COPYING
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
 ifeq ($(BR2_USE_MMU),)
