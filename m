From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:44 +0200
Subject: [Buildroot] [git commit] package/python-mistune: bump version to
	0.7.3
Message-ID: <20161005210758.7CCAC7FF68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdd6903dbc3b76bca1991a98e90cbf7cbff15f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-mistune/python-mistune.hash | 6 +++---
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index 8509606..cfc6a25 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ed9ac03c99261bd1803e44ddaa4f87cb, sha256 locally computed.
-md5	ed9ac03c99261bd1803e44ddaa4f87cb  mistune-0.7.2.tar.gz
-sha256	626f2516adcde4af608eaf83635ff20ff7e577c1898ad4d0f0fcd8c094399840  mistune-0.7.2.tar.gz
+# md5 from https://pypi.python.org/pypi/mistune/json, sha256 locally computed
+md5	4eba50bd121b83716fa4be6a4049004b  mistune-0.7.3.tar.gz
+sha256	21d0e869df3b9189f248e022f1c9763cf9069e1a2f00676f1f1852bd7f98b713  mistune-0.7.3.tar.gz
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index f0301a7..91e97e8 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 0.7.2
+PYTHON_MISTUNE_VERSION = 0.7.3
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
+PYTHON_MISTUNE_SITE = https://pypi.python.org/packages/88/1e/be99791262b3a794332fda598a07c2749a433b9378586361ba9d8e824607
 PYTHON_MISTUNE_LICENSE = BSD-3c
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
