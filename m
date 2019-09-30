From: Esben Haabendal <esben@geanix.com>
Date: Mon, 30 Sep 2019 10:47:41 +0200
Subject: [Buildroot] [PATCH v4] package/python-matplotlib: add kiwisolver
 dependency
Message-ID: <20190930084741.4641-1-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed by matplotlib.pyplot, and is also documented at
https://matplotlib.org/users/installing.html#building-on-linux

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 package/python-matplotlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 07160affd043..e6ed8cda2f28 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON_CYCLER
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-- 
2.23.0
