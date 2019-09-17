From: Esben Haabendal <esben@geanix.com>
Date: Tue, 17 Sep 2019 10:50:34 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-matplotlib: add
 kiwisolver dependency
In-Reply-To: <20190917085034.2509-1-esben@geanix.com>
References: <20190917085034.2509-1-esben@geanix.com>
Message-ID: <20190917085034.2509-2-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed by matplotlib.pyplot, and is also documented at
https://matplotlib.org/users/installing.html#building-on-linux

Signed-off-by: Esben Haabendal <esben@geanix.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
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
