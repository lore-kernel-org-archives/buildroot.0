From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 24 Jun 2021 00:52:31 +1000
Subject: [Buildroot] [PATCH] package/python-greenlet: enable as host package
Message-ID: <20210623145231.19243-1-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 package/python-greenlet/python-greenlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 01d578a183..e90d1c0f56 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.32.0
