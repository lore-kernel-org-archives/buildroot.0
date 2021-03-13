From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:59:05 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openssh: bump to
 version 8.3p1
Message-ID: <20210313143654.527F183C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d7544520a657193d3201dbeb39664c0b1609ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Format hash file with two spaces separators.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b53aea70e68d0922e144217c26785a3999be1169)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2f962d4337..1d7dc14fb6 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.2 (base64 encoded)
-sha256 43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671  openssh-8.2p1.tar.gz
+# From https://www.openssh.com/txt/release-8.3 (base64 encoded)
+sha256  f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2  openssh-8.3p1.tar.gz
 # Locally calculated
-sha256 73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
+sha256  73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b4651b5971..860e738ab6 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.2p1
+OPENSSH_VERSION = 8.3p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
