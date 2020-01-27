From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 27 Jan 2020 13:37:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-pigpio: Bump to version 1.45
In-Reply-To: <20200127123723.289194-1-grzegorz@blach.pl>
References: <20200127123723.289194-1-grzegorz@blach.pl>
Message-ID: <20200127123723.289194-2-grzegorz@blach.pl>
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
index 71dd617e8e..3498b762ee 100644
--- a/package/python-pigpio/python-pigpio.hash
+++ b/package/python-pigpio/python-pigpio.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pigpio/json
-md5	17c1a662f43b17a0c7e671a0a351d468  pigpio-1.44.tar.gz
-sha256	df5e430e5c026c95f575cb50ccd18eb37d41be4e0bbbde070ab332dae27fdf58  pigpio-1.44.tar.gz
+md5	a6817d953549c19522bae2d4f36251f4  pigpio-1.45.tar.gz
+sha256	a6a8dbc19e827046bde02b4c34ab725d55093490ed7bc1e7c80277adfadc16ac  pigpio-1.45.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index 52bc23249e..1e18d97840 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIGPIO_VERSION = 1.44
+PYTHON_PIGPIO_VERSION = 1.45
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/8a/30/16b92e0fede5c543f56875c11f8658457af24991277aee693e0e66a6c967
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/33/48/db99b4ccc9f895827aa96d35404bae803b31555cdef0c1356ad3b6fca2d5
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
-- 
2.25.0
