From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 18:43:26 +0200
Subject: [Buildroot] [git commit] package/unbound: bump version to 1.11.0
Message-ID: <20200803164347.C320F82DE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a1a78692c44c52fe868c4c87ff76ac4c5dcaab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 2 +-
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 52d78e1678..650120d40e 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b73677c21a71cf92f15cc8cfe76a3d875e40f65b6150081c39620b286582d536  unbound-1.10.1.tar.gz
+sha256 9f2f0798f76eb8f30feaeda7e442ceed479bc54db0e3ac19c052d68685e51ef7  unbound-1.11.0.tar.gz
 sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 0917db1def..6cf852ad9d 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.10.1
+UNBOUND_VERSION = 1.11.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
