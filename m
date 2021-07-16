From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:30:51 +0200
Subject: [Buildroot] [git commit] package/linuxptp: security bump version to
 3.1.1
Message-ID: <20210716205709.F1355911FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a7f3dc0a02972b8270f898eaab8d82a439686ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following CVEs:
 - CVE-2021-3570 linuxptp: missing length check of forwarded messages
 - CVE-2021-3571 linuxptp: wrong length of one-step follow-up in transparent clock

See mailing list post for details: https://sourceforge.net/p/linuxptp/mailman/message/37315519/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxptp/linuxptp.hash | 8 ++++----
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 4f8a1f89fc..a5479b0ebc 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/linuxptp/files/v3.0/
-sha1  9a3869dbd322252c9a6bc0dbdfe8941586810a7f  linuxptp-3.1.tgz
-md5  2264cb69c9af947028835c12c89a7572  linuxptp-3.1.tgz
+# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
+sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
+md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
 
 # Locally computed:
-sha256  f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d  linuxptp-3.1.tgz
+sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index f91be921af..da23631d20 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.1
+LINUXPTP_VERSION = 3.1.1
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
