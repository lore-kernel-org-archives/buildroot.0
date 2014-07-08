From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:47:43 +0200
Subject: [Buildroot] [git commit] quota: add license information
Message-ID: <20140708222427.EDE269D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab3e8f3447115d4115214b34f931375d9756e10c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quota/quota.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 4febb50..1cc96d7 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -8,6 +8,7 @@ QUOTA_VERSION = 4.00
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
+QUOTA_LICENSE = GPLv2+
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
 QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
