From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 20 Mar 2018 15:39:41 -0500
Subject: [Buildroot] [PATCH v3 1/3] python-decorator: update to add host
 package
Message-ID: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add host package for python decorator

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v2 -> v3: Update to remove the dependency changes
v1 -> v2: No change

---
 package/python-decorator/python-decorator.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index c0c43f6..3802f3d 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -11,3 +11,4 @@ PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
