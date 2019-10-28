From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 13:57:23 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/python-pysnmp-apps: update license to BSD-2-Clause
Message-ID: <20191028125343.6F0308B4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10f0e76d33dfe80c0e691b2c4e8910031a19a105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The license file for this application is BSD-2-Clause and not
BSD-3-Clause as we currently state in the _LICENSE variable.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1eb8252cceab962079cee3b1677480d098808b75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pysnmp-apps/python-pysnmp-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index 79c436fa73..ac43fda193 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -8,7 +8,7 @@ PYTHON_PYSNMP_APPS_VERSION = 0.4.1
 PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
 PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_APPS_LICENSE = BSD-3-Clause
+PYTHON_PYSNMP_APPS_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
