From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  2 Aug 2017 07:57:23 +0200
Subject: [Buildroot] [PATCH v2 1/4] python-mistune: add host variant
In-Reply-To: <20170802055726.18461-1-yegorslists@googlemail.com>
References: <20170802055726.18461-1-yegorslists@googlemail.com>
Message-ID: <20170802055726.18461-2-yegorslists@googlemail.com>
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
index 6bc0b2066..4141729da 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -12,3 +12,4 @@ PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.11.0
