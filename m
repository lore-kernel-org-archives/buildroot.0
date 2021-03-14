From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:08:38 +0100
Subject: [Buildroot] [git commit] package/python-click: bump version to 7.1.2
Message-ID: <20210314164744.3695A83D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa5f269ff66b8c83cf415de6ff22453631890b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 7.1.2
- update license hash ('standardize license' [0] to the exact text as
  SPDX provides [1])

[0] https://github.com/pallets/click/commit/d64eddae7d59cebd24b5100d72147fcf2e7cd1dc
[1] https://spdx.org/licenses/BSD-3-Clause.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-click/python-click.hash | 6 +++---
 package/python-click/python-click.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 911f13dfa3..fb6e457ad5 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5 7f53d50f7b7373ebc7963f9ff697450a Click-7.0.tar.gz
-sha256 5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7 Click-7.0.tar.gz
+md5  53692f62cb99a1a10c59248f1776d9c0  click-7.1.2.tar.gz
+sha256  d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a  click-7.1.2.tar.gz
 # Locally computed sha256
-sha256 e212319faefa4f459c8ac937fdc8557040a3cab8af29366ca2a48d239025225c LICENSE.rst
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 12539f557b..a829257f5e 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 7.0
-PYTHON_CLICK_SOURCE = Click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47
+PYTHON_CLICK_VERSION = 7.1.2
+PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
