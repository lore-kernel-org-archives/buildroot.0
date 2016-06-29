From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:23 +0200
Subject: [Buildroot] [PATCH 16/24] python-mako: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-17-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python-mako/python-mako.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 52679e051857..8db518cf38b0 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -11,8 +11,4 @@ PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
 
-# In host build, setup.py tries to download markupsafe if it is not installed
-HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
-
 $(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.1.0
