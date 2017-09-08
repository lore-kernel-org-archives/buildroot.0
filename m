From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  8 Sep 2017 16:14:14 +0200
Subject: [Buildroot] [PATCH] python-six: add host variant
Message-ID: <20170908141414.24801-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Gauthier <samuel.gauthier@6wind.com>

Needed to build Open vSwitch >= 2.6.

Signed-off-by: Samuel Gauthier <samuel.gauthier@6wind.com>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python-six/python-six.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 0edefe346fdb..850f9340d322 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -12,3 +12,4 @@ PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.13.1
