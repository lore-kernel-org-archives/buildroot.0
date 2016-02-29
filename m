From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:45:32 +0100
Subject: [Buildroot] [git commit branch/next] openssh: bump to version 7.2p1
Message-ID: <20160229204537.492A581801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c62637bdd473236d50ec459c9074ad8a8834129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index b93b4a9..36346e0 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-7.1p2
-sha256	dd75f024dcf21e06a0d6421d582690bf987a1f6323e32ad6619392f3bfde6bbd	openssh-7.1p2.tar.gz
+# Also from http://www.openssh.com/txt/release-7.2
+sha256	973cc37b2f3597e4cf599b09e604e79c0fe5d9b6f595a24e91ed0662860b4ac3	openssh-7.2p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4e97849..0e0bcab 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.1p2
+OPENSSH_VERSION = 7.2p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
