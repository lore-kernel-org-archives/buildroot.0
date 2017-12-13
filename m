From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:34 +0100
Subject: [Buildroot] [git commit] package/python-characteristic: switch SITE
 to https
Message-ID: <20171213070253.5B18380F8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=515466191d41aa7b94ee4af17d03f3a029cab476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-characteristic/python-characteristic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
index dc3e8bb..7ea8d95 100644
--- a/package/python-characteristic/python-characteristic.mk
+++ b/package/python-characteristic/python-characteristic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARACTERISTIC_VERSION = 14.3.0
 PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
-PYTHON_CHARACTERISTIC_SITE = http://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_SITE = https://pypi.python.org/packages/source/c/characteristic
 PYTHON_CHARACTERISTIC_LICENSE = MIT
 PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
 PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
