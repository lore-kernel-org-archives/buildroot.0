From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Apr 2019 19:45:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-ply: add host variant
Message-ID: <20190430174557.2108-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-ply is needed to make bind configure script happy

Fixes:
 - http://autobuild.buildroot.org/results/a68251773f61c3463f4d18aa626c83df70126afc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ply/python-ply.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 95a290a7c4..5dc7964d5f 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -12,3 +12,4 @@ PYTHON_PLY_LICENSE = BSD-3-Clause
 PYTHON_PLY_LICENSE_FILES = README.md
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
