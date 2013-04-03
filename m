From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:42:28 +0200
Subject: [Buildroot] [git commit] quota: needs host-gettext
Message-ID: <20130403204841.7EEEC9B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05c73a95718908b8223a37e6c3e6d36b7eded565
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ce1016e38e3e629dec8a54fa2d1436252831e0bf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/quota.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 899dfdd..c89ed9b 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -7,7 +7,7 @@
 QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
-
+QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
