From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:38 +0200
Subject: [Buildroot] [PATCH 04/12] dado: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dado/dado.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index acef04777..e4375a3a6 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -6,5 +6,6 @@
 
 DADO_VERSION = 1.8.3-1
 DADO_LICENSE = MIT
+DADO_LICENSE_FILES = $(DADO_SUBDIR)/doc/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
