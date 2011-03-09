From: Alexander Yohananov <yohananov@gmail.com>
Date: Wed, 9 Mar 2011 11:28:59 +0200
Subject: [Buildroot] [PATCH] lockfile-progs: add dependency on liblockfile
Message-ID: <AANLkTinX1TBoNM3j6NkHB0E36o4dnemnFRjjjk4ThDCJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Yohananov <yohananov@gmail.com>
---
Hope it's made properly (using git format-patch -s --stat origin)

 package/lockfile-progs/lockfile-progs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mkb/package/lockfile-progs/
lockfile-progs.mk
index f8d8cee..031712e 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -6,6 +6,7 @@
 LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE =
$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_DEPENDENCIES = liblockfile

 LOCKFILE_BINS = \
  $(addprefix lockfile-,check create remove touch) \
-- 
1.7.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110309/8520fcce/attachment.html>
