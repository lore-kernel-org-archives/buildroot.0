From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:37 +0100
Subject: [Buildroot] [git commit] package/python-cheetah: switch SITE to
 https
Message-ID: <20171213070253.72EBD80F8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f1d0abe183ea381e3ece9ee4fe0f75e3fe7c4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cheetah/python-cheetah.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index af7d1f5..eee87fc 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHEETAH_VERSION = 2.4.4
 PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
+PYTHON_CHEETAH_SITE = https://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
