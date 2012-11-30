From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:34 +0100
Subject: [Buildroot] [PATCH v2] sylpheed: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/sylpheed/sylpheed.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index cf55c90..f26e5fc 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -8,6 +8,8 @@ SYLPHEED_VERSION_MINOR = 0
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
+SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
+SYLPHEED_LICENSE_FILES = COPIYNG COPYING.LIB
 
 SYLPHEED_CONF_OPT = --disable-gtkspell
 
-- 
1.8.0.1
