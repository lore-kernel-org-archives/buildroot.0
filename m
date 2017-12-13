From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:00 +0100
Subject: [Buildroot] [PATCH 01/11] package/python-keyring: switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f73/f7322f19303daa3d403f2c0f13379d947431300d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-keyring/python-keyring.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index ef8b8af261..c1ac15f28b 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KEYRING_VERSION = 3.0.5
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).zip
-PYTHON_KEYRING_SITE = http://pypi.python.org/packages/source/k/keyring
+PYTHON_KEYRING_SITE = https://pypi.python.org/packages/source/k/keyring
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = python software foundation license
 
-- 
2.11.0
