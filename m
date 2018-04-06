From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  6 Apr 2018 13:20:03 +0300
Subject: [Buildroot] [PATCH 1/1] python-yieldfrom: fix wrong package name in
 license
Message-ID: <20180406102003.10572-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the _LICENSE and _LICENSE_FILES variables, that were mistakenly
created with PYTHON_JSONMODELS instead of PYTHON_YIELDFROM

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-yieldfrom/python-yieldfrom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
index 2e775b3133..cb4a05d83a 100644
--- a/package/python-yieldfrom/python-yieldfrom.mk
+++ b/package/python-yieldfrom/python-yieldfrom.mk
@@ -8,8 +8,8 @@ PYTHON_YIELDFROM_VERSION = 1.0.3
 PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
 PYTHON_YIELDFROM_SITE = https://pypi.python.org/packages/de/2d/05524f368e691846824d962b64f983e3fde9b8c10839e7efbc1b51d42de3
 PYTHON_YIELDFROM_SETUP_TYPE = setuptools
-PYTHON_JSONMODELS_LICENSE = MIT
-PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
+PYTHON_YIELDFROM_LICENSE = MIT
+PYTHON_YIELDFROM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.16.2
