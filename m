From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:57:17 +0200
Subject: [Buildroot] [git commit] package/lftp: bump to version 4.9.2
Message-ID: <20200902161639.4254885EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8377683ff939c8c938d0e284bca37d3d90e395b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Extract from NEWS:

- mkdir: fixed exit code with -f option.
- ftp: made ftp:use-pret setting tri-boolean.
- get/mget/put/mput: don't try next files after error if cmd:fail-exit
  is true.
- get/mget: fixed -O option with remote URL and xfer:use-temp-file being
  true.
- mirror: disallow empty patterns; don't delete "..".
- mirror: fixed --on-change with --reverse.
- sftp: fixed a bug with truncated files when packets are reordered
  (finally).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lftp/lftp.hash | 8 ++++----
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index a2f60f95b0..e4c3305c03 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,7 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.9.1.md5sum
-md5 3da57b1960b1416e89a532c54a67a936  lftp-4.9.1.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.9.2.md5sum
+md5  b3a272ecb7a2b60e3827776f90ffb2f3  lftp-4.9.2.tar.xz
 # Locally calculated after checking gpg signature
-sha256 5969fcaefd102955dd882f3bcd8962198bc537224749ed92f206f415207a024b  lftp-4.9.1.tar.xz
+sha256  c517c4f4f9c39bd415d7313088a2b1e313b2d386867fe40b7692b83a20f0670d  lftp-4.9.2.tar.xz
 
 # Hash for license file:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 9c568da677..1348e137de 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.9.1
+LFTP_VERSION = 4.9.2
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
