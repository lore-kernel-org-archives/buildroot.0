From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:22 +0200
Subject: [Buildroot] [PATCH 15/24] python-jinja2: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-16-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python-jinja2/python-jinja2.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index ce6e2b9c5fc8..40cee81210d8 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,8 +10,5 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
-# In host build, setup.py tries to download markupsafe if it is not installed
-HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
 $(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.1.0
