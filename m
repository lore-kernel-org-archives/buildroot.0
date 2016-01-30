From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:33:13 +0100
Subject: [Buildroot] [git commit] package/fio: bump version to 2.6,
	fix musl build
Message-ID: <20160201224659.ACD087FC43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f22b47c39fd8840486a1daf592f5621b80d5d5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/063/0637236b89e3251bbf8b649ff60de0ff19494703/
http://autobuild.buildroot.net/results/2fe/2fefe784fb45368344775c7b6f2eb83e1c0c2104/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
