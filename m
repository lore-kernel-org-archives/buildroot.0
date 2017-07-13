From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:54:38 +0200
Subject: [Buildroot] [git commit] python-versiontools: add host variant
Message-ID: <20170713085046.8EFCB81EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13582f320445a0814daddbc833b54ae82c64f4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will be needed by python-json-schema-validator.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-versiontools/python-versiontools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index 2170730..fbf1040 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -11,3 +11,4 @@ PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
 PYTHON_VERSIONTOOLS_LICENSE = LGPL-3.0
 
 $(eval $(python-package))
+$(eval $(host-python-package))
