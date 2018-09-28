From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 28 Sep 2018 15:04:34 -0500
Subject: [Buildroot] [PATCH 1/2] package/python-enum34: enable host build
Message-ID: <1538165075-58848-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is initially used by the setools package to do offline
policy analysis using host tools.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python-enum34/python-enum34.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index c612cb6..09d1143 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -12,3 +12,4 @@ PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
