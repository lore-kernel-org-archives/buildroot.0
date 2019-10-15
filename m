From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2019 11:20:03 +0200
Subject: [Buildroot] [git commit] package/openssh: bump to version 8.1p1
Message-ID: <20191015091537.C07398E19C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39db688a375f66e8d8f26f8111e7f84427090fd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump is not marked as security bump. The 8.1 release fixes a XMSS
key parsing code vulnerability. This code can not be enabled without
explicit definition of the WITH_XMSS macro.

Update LICENCE hash; converted to UTF-8.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index f4ae9042a1..4db933f7b0 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From http://www.openssh.com/txt/release-8.0 (base64 encoded)
-sha256 bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68  openssh-8.0p1.tar.gz
+# From https://www.openssh.com/txt/release-8.1 (base64 encoded)
+sha256 02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff  openssh-8.1p1.tar.gz
 # Locally calculated
-sha256 05a4c25ef464e19656c5259bd4f4da8428efab01044f3541b79fbb3ff209350f  LICENCE
+sha256 73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 85c570ce40..47a724d839 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.0p1
+OPENSSH_VERSION = 8.1p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
