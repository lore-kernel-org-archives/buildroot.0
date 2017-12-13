From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:31 +0100
Subject: [Buildroot] [git commit] package/python-keyring: switch SITE to
 https
Message-ID: <20171213070253.3E1E382BDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18529a4f29aa8c204fb54510af9cda9e9b992f9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/f73/f7322f19303daa3d403f2c0f13379d947431300d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-keyring/python-keyring.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index ef8b8af..c1ac15f 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KEYRING_VERSION = 3.0.5
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).zip
-PYTHON_KEYRING_SITE = http://pypi.python.org/packages/source/k/keyring
+PYTHON_KEYRING_SITE = https://pypi.python.org/packages/source/k/keyring
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = python software foundation license
 
