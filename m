From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 19:57:24 +0200
Subject: [Buildroot] [PATCH/next] package/fio: bump version to 2.20, add hash
Message-ID: <20170521175724.24562-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fio/fio.hash | 2 ++
 package/fio/fio.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/fio/fio.hash

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
new file mode 100644
index 000000000..7eb08140c
--- /dev/null
+++ b/package/fio/fio.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 1952db4d534221e6e8454f851dfcc38328b0ed4a3f499ea25a51ca2b5ccc8136  fio-fio-2.20.tar.gz
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index e7e9fbe2e..c109f0795 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-2.13
+FIO_VERSION = fio-2.20
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPL-2.0 + special obligations
 FIO_LICENSE_FILES = COPYING
-- 
2.11.0
