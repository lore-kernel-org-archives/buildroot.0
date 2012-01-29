From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:45 +0100
Subject: [Buildroot] [RFC 12/15] lzop: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-13-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/lzop/lzop.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 6d1d674..2ef329b 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,6 +6,7 @@
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
+LZOP_LICENSE = GPL_V2
 LZOP_DEPENDENCIES = lzo
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.5.4
