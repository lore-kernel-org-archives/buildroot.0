From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:07:04 +0100
Subject: [Buildroot] [git commit] package/fio: fix license file
Message-ID: <20160201224701.986F57F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2daaf9179b43a524c944b15a42b23ef920f4627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sorry, I missed the changed filename.

Fixes
http://autobuild.buildroot.net/results/a35/a3596283632433831ea24c1d586f2067b034eb32/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
