From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  5 Oct 2020 17:12:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pigpio: bump to version 1.78
In-Reply-To: <20201005151242.4216-1-grzegorz@blach.pl>
References: <20201005151242.4216-1-grzegorz@blach.pl>
Message-ID: <20201005151242.4216-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-pigpio/python-pigpio.hash | 4 ++--
 package/python-pigpio/python-pigpio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pigpio/python-pigpio.hash b/package/python-pigpio/python-pigpio.hash
index dd7b7954a7..7e02054b23 100644
--- a/package/python-pigpio/python-pigpio.hash
+++ b/package/python-pigpio/python-pigpio.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pigpio/json
-md5  5247f61642f14f65c2b42e130d49ab50  pigpio-1.46.tar.gz
-sha256  f5f2562f8f7aab0c6cf7235e501e72bedbf063efda725c6086c352b5e4b2f59d  pigpio-1.46.tar.gz
+md5  e05e3f5cb6c50f4b3eeb4ac50627507e  pigpio-1.78.tar.gz
+sha256  91efa50e4990649da97408a384782d6ccf58342fc59cdfe21ed7a42911569975  pigpio-1.78.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index fda5efb1ae..73e326cba1 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIGPIO_VERSION = 1.46
+PYTHON_PIGPIO_VERSION = 1.78
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/5d/ad/75966e59159a64f3d496bf730c54d6222d69a72261f1556232e25ce59edf
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/a9/4a/3ebdfd90906553fb5420e80a475eb52f0809f2a29b547ba3b260db0cbc8f
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
-- 
2.28.0
