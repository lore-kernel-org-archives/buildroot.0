From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sat, 15 Dec 2018 01:19:23 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-pigpio: bump to version 1.42
In-Reply-To: <20181215001924.1779-1-grzegorz@blach.pl>
References: <20181215001924.1779-1-grzegorz@blach.pl>
Message-ID: <20181215001924.1779-2-grzegorz@blach.pl>
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
index a0ef093ec5..41ac25c350 100644
--- a/package/python-pigpio/python-pigpio.hash
+++ b/package/python-pigpio/python-pigpio.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pigpio/json
-md5	32d7d5e2e042fb4f503b93858712e7ad  pigpio-1.40.post1.tar.gz
-sha256	38bdc1b4d58898e7b4a69de3b0d90e8e8ccd851ac7d03e30791769475ffd941f  pigpio-1.40.post1.tar.gz
+md5	f63ca89fdc733a5bad784155e6c1b9ff  pigpio-1.42.tar.gz
+sha256	274fc6df10a787e6a34b748a61a142f38dbf812b386f5b1762c66ad6a67b7873  pigpio-1.42.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index 7c4527ad94..7da1b6f4b0 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIGPIO_VERSION = 1.40.post1
+PYTHON_PIGPIO_VERSION = 1.42
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/da/91/80c893c398bc6805592f44267bbf4bf88323de3db0f5e8f94b0fa8e28426
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/f6/c1/73d7b4287e2edc7e06ac34a4ec0c73d4758ba755a8d2ecc2aaf57bf7d54c
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
-- 
2.19.2
