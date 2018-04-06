From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 12:42:32 +0200
Subject: [Buildroot] [git commit] python-yieldfrom: fix wrong package name
 in license
Message-ID: <20180406104337.7E7BD86425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c261f44b953535c0eb0cbd907f0b079205e81d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the _LICENSE and _LICENSE_FILES variables, that were mistakenly
created with PYTHON_JSONMODELS instead of PYTHON_YIELDFROM

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
