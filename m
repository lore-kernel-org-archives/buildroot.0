From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:58 +0100
Subject: [Buildroot] [git commit] package/python-versiontools: switch SITE
 to https
Message-ID: <20171213070253.EA3E7827DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b971aca107d3abb8828f2df72b8a149055c2af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-versiontools/python-versiontools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index fbf1040..b99ddec 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VERSIONTOOLS_VERSION = 1.9.1
 PYTHON_VERSIONTOOLS_SOURCE = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
-PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools
+PYTHON_VERSIONTOOLS_SITE = https://pypi.python.org/packages/source/v/versiontools
 PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
 PYTHON_VERSIONTOOLS_LICENSE = LGPL-3.0
 
