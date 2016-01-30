From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 08:26:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/fio: bump version to 2.6,
	fix musl build
Message-ID: <1454138787-13444-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/063/0637236b89e3251bbf8b649ff60de0ff19494703/
http://autobuild.buildroot.net/results/2fe/2fefe784fb45368344775c7b6f2eb83e1c0c2104/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fio/fio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index f9a690e..9b14809 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-2.1.4
+FIO_VERSION = fio-2.6
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
 FIO_LICENSE_FILES = LICENSE
-- 
2.7.0.rc3
