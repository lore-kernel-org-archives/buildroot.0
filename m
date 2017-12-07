From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Dec 2017 09:20:21 +0100
Subject: [Buildroot] [PATCH 5/5] python-pytablewriter: bump to version 0.27.1
In-Reply-To: <20171207082021.4605-1-yegorslists@googlemail.com>
References: <20171207082021.4605-1-yegorslists@googlemail.com>
Message-ID: <20171207082021.4605-5-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablewriter/Config.in                 | 1 +
 package/python-pytablewriter/python-pytablewriter.hash | 5 +++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 1ef27be18a..10672dc467 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
 	select BR2_PACKAGE_PYTHON_SIMPLESQLITE # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TOML # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index abe5ad0d4e..36e1453920 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5	f7655aaf8d3b2496e08a36bce4c38b91  pytablewriter-0.24.0.tar.gz
-sha256	94741a1837502fb8172bf6b2f4410a42804efaeffdf34660c375ed0a9424df4e  pytablewriter-0.24.0.tar.gz
+md5	7d7eff9665b1d9e0c0189c34f8c562c3  pytablewriter-0.27.1.tar.gz
+sha256	89e43bffc60ea93f0ed0cc8d8ddbf34ac0b74f8cf781c6c39f4c8bc3a7e4c436  pytablewriter-0.27.1.tar.gz
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index ac1480c003..dd87213e2c 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.24.0
+PYTHON_PYTABLEWRITER_VERSION = 0.27.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/65/b0/efafdd9e4d5b08069371530e46acde684ac7fb18bffa09b635e2af091d82
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/c2/88/6a9f6cbdabd773ba6de6c41d7a0af58eed37ca97b1d666b04819d0bf9b54
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.11.0
