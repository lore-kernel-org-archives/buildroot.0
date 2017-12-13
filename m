From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:52 +0100
Subject: [Buildroot] [git commit] package/python-shutilwhich: switch SITE to
 https
Message-ID: <20171213070253.CCFDA7FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c04057571c07cff994bf6aebcf0893fb5c29689a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-shutilwhich/python-shutilwhich.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
index 31a7ea9..0cf968a 100644
--- a/package/python-shutilwhich/python-shutilwhich.mk
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SHUTILWHICH_VERSION = 1.1.0
 PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
-PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
+PYTHON_SHUTILWHICH_SITE = https://pypi.python.org/packages/source/s/shutilwhich
 PYTHON_SHUTILWHICH_LICENSE = Python-2.0
 PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
 
