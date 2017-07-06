From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Jul 2017 11:08:58 +0200
Subject: [Buildroot] [PATCH 1/3] python-mistune: add host variant
Message-ID: <20170706090900.15999-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Host variant is required by host-python-m2r.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-mistune/python-mistune.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 6bc0b20668..4141729da8 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -12,3 +12,4 @@ PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.11.0
