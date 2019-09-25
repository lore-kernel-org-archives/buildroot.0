From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:30:54 +0200
Subject: [Buildroot] [git commit] package/python-pigpio: bump to version 1.44
Message-ID: <20190925202934.0D6978F6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d81680ade9e6ad4d51b8fabe9b101d86e5455ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pigpio/python-pigpio.hash | 4 ++--
 package/python-pigpio/python-pigpio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pigpio/python-pigpio.hash b/package/python-pigpio/python-pigpio.hash
index 41ac25c350..71dd617e8e 100644
--- a/package/python-pigpio/python-pigpio.hash
+++ b/package/python-pigpio/python-pigpio.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pigpio/json
-md5	f63ca89fdc733a5bad784155e6c1b9ff  pigpio-1.42.tar.gz
-sha256	274fc6df10a787e6a34b748a61a142f38dbf812b386f5b1762c66ad6a67b7873  pigpio-1.42.tar.gz
+md5	17c1a662f43b17a0c7e671a0a351d468  pigpio-1.44.tar.gz
+sha256	df5e430e5c026c95f575cb50ccd18eb37d41be4e0bbbde070ab332dae27fdf58  pigpio-1.44.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index 7da1b6f4b0..52bc23249e 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIGPIO_VERSION = 1.42
+PYTHON_PIGPIO_VERSION = 1.44
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/f6/c1/73d7b4287e2edc7e06ac34a4ec0c73d4758ba755a8d2ecc2aaf57bf7d54c
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/8a/30/16b92e0fede5c543f56875c11f8658457af24991277aee693e0e66a6c967
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
