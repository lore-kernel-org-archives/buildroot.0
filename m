From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:50 +0530
Subject: [Buildroot] [PATCH 21/21] scripts/scanpypi: use SPDX short
	identifier for license
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-22-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 support/scripts/scanpypi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index e150ae5..e174ac6 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -380,18 +380,18 @@ class BuildrootPackage():
         license_dict = {
             'Apache Software License': 'Apache-2.0',
             'BSD License': 'BSD',
-            'European Union Public Licence 1.0': 'EUPLv1.0',
-            'European Union Public Licence 1.1': 'EUPLv1.1',
+            'European Union Public Licence 1.0': 'EUPL-1.0',
+            'European Union Public Licence 1.1': 'EUPL-1.1',
             "GNU General Public License": "GPL",
-            "GNU General Public License v2": "GPLv2",
-            "GNU General Public License v2 or later": "GPLv2+",
-            "GNU General Public License v3": "GPLv3",
-            "GNU General Public License v3 or later": "GPLv3+",
-            "GNU Lesser General Public License v2": "LGPLv2.1",
-            "GNU Lesser General Public License v2 or later": "LGPLv2.1+",
-            "GNU Lesser General Public License v3": "LGPLv3",
-            "GNU Lesser General Public License v3 or later": "LGPLv3+",
-            "GNU Library or Lesser General Public License": "LGPLv2",
+            "GNU General Public License v2": "GPL-2.0",
+            "GNU General Public License v2 or later": "GPL-2.0+",
+            "GNU General Public License v3": "GPL-3.0",
+            "GNU General Public License v3 or later": "GPL-3.0+",
+            "GNU Lesser General Public License v2": "LGPL-2.1",
+            "GNU Lesser General Public License v2 or later": "LGPL-2.1+",
+            "GNU Lesser General Public License v3": "LGPL-3.0",
+            "GNU Lesser General Public License v3 or later": "LGPL-3.0+",
+            "GNU Library or Lesser General Public License": "LGPL-2.0",
             "ISC License": "ISC",
             "MIT License": "MIT",
             "Mozilla Public License 1.0": "MPL-1.0",
-- 
2.6.2
