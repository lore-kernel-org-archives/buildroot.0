From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:39 +0200
Subject: [Buildroot] [PATCH v3 18/22] lzop: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-18-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/lzop/lzop.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 6d1d674..1e98030 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,6 +6,8 @@
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
+LZOP_LICENSE = GPLv2+
+LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.5.4
