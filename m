From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:49:12 +0200
Subject: [Buildroot] [git commit] python-backports-abc: add version to
	license string
Message-ID: <20170409115341.8F6BA807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a29fce598f1a9f283e44dbbafa791942c7793c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file refers to Python license version 2. Use SPDX short
identifier for license string and add license file while at it.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-backports-abc/python-backports-abc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-backports-abc/python-backports-abc.mk b/package/python-backports-abc/python-backports-abc.mk
index f84318b..66cea17 100644
--- a/package/python-backports-abc/python-backports-abc.mk
+++ b/package/python-backports-abc/python-backports-abc.mk
@@ -7,7 +7,8 @@
 PYTHON_BACKPORTS_ABC_VERSION = 0.5
 PYTHON_BACKPORTS_ABC_SOURCE = backports_abc-$(PYTHON_BACKPORTS_ABC_VERSION).tar.gz
 PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8
-PYTHON_BACKPORTS_ABC_LICENSE = Python Software Foundation License
+PYTHON_BACKPORTS_ABC_LICENSE = Python-2.0
+PYTHON_BACKPORTS_ABC_LICENSE_FILES = LICENSE
 PYTHON_BACKPORTS_ABC_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
