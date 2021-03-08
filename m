From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:48:20 +0100
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.2.2
Message-ID: <20210308222722.A5EB188C89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c5a1d49d62040e8713c5151ba6aca8499251ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/troglobit/sysklogd/releases/tag/v2.2.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index ec14363d9f..0ef5e17116 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a93b7ad6a615336f030d8a3257544cff1644908af6a12c65f65482f27bd39ca9  sysklogd-2.2.1.tar.gz
+sha256  2752a693a2486f7e532b6b028296c8ac0a97def8a4848f1e915f3e583fd0b4b6  sysklogd-2.2.2.tar.gz
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index ea7b869d7b..0110974069 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.1
+SYSKLOGD_VERSION = 2.2.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
