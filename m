From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:19:02 +0200
Subject: [Buildroot] [git commit] package/python-pigpio: bump to version 1.46
Message-ID: <20200408190601.3379A89006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c5c9af2177690a0b5a21321a7a7e76e0f3d892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pigpio/python-pigpio.hash | 4 ++--
 package/python-pigpio/python-pigpio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pigpio/python-pigpio.hash b/package/python-pigpio/python-pigpio.hash
index 3498b762ee..dd7b7954a7 100644
--- a/package/python-pigpio/python-pigpio.hash
+++ b/package/python-pigpio/python-pigpio.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pigpio/json
-md5	a6817d953549c19522bae2d4f36251f4  pigpio-1.45.tar.gz
-sha256	a6a8dbc19e827046bde02b4c34ab725d55093490ed7bc1e7c80277adfadc16ac  pigpio-1.45.tar.gz
+md5  5247f61642f14f65c2b42e130d49ab50  pigpio-1.46.tar.gz
+sha256  f5f2562f8f7aab0c6cf7235e501e72bedbf063efda725c6086c352b5e4b2f59d  pigpio-1.46.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index 1e18d97840..fda5efb1ae 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIGPIO_VERSION = 1.45
+PYTHON_PIGPIO_VERSION = 1.46
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/33/48/db99b4ccc9f895827aa96d35404bae803b31555cdef0c1356ad3b6fca2d5
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/5d/ad/75966e59159a64f3d496bf730c54d6222d69a72261f1556232e25ce59edf
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
