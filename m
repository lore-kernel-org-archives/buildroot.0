From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:43:36 +0200
Subject: [Buildroot] [git commit] scripts/scanpypi: use SPDX short
	identifier for license
Message-ID: <20170401134426.44CA682620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8ff7ab0be1cd3aa846829dc234d8c67b1bda0dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
