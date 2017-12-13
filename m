From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:02 +0100
Subject: [Buildroot] [PATCH 03/11] package/python-cheetah: switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-cheetah/python-cheetah.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index af7d1f5494..eee87fcee7 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHEETAH_VERSION = 2.4.4
 PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
+PYTHON_CHEETAH_SITE = https://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
-- 
2.11.0
