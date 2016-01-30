From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 11:30:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/fio: fix license file
Message-ID: <1454149854-16525-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I missed the changed filename.

Fixes
http://autobuild.buildroot.net/results/a35/a3596283632433831ea24c1d586f2067b034eb32/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fio/fio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 9b14809..08fef5f 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -7,7 +7,7 @@
 FIO_VERSION = fio-2.6
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
-FIO_LICENSE_FILES = LICENSE
+FIO_LICENSE_FILES = COPYING
 
 define FIO_CONFIGURE_CMDS
 	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
-- 
2.7.0.rc3
