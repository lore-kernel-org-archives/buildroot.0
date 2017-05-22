From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:07:48 +0200
Subject: [Buildroot] [git commit] package/fio: bump version to 2.20, add hash
Message-ID: <20170601202853.6F7EF807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a74a010116f4a76bad6100bb4a663e9423fffae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/fio.hash | 2 ++
 package/fio/fio.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
new file mode 100644
index 0000000..7eb0814
--- /dev/null
+++ b/package/fio/fio.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 1952db4d534221e6e8454f851dfcc38328b0ed4a3f499ea25a51ca2b5ccc8136  fio-fio-2.20.tar.gz
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index e7e9fbe..c109f07 100644
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
