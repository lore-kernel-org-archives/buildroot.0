From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:10:03 +0100
Subject: [Buildroot] [git commit] package/python-wsaccel:switch SITE to https
Message-ID: <20171213070254.04B90827DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9939911f9c3c5a9e5af14502b4629696cf1104c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-wsaccel/python-wsaccel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 3e7b332..016ff2d 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WSACCEL_VERSION = 0.6.2
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = http://pypi.python.org/packages/source/w/wsaccel
+PYTHON_WSACCEL_SITE = https://pypi.python.org/packages/source/w/wsaccel
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
 
