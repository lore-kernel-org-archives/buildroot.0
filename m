From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:24:29 +0200
Subject: [Buildroot] [git commit] package/lsscsi: bump version to 0.31
Message-ID: <20200413201030.D870B8EB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=710bcdabfa498ee1d25676ef497d08d4f6f7922a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://sg.danny.cz/scsi/lsscsi.ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lsscsi/lsscsi.hash | 4 ++--
 package/lsscsi/lsscsi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
index fe1bc5d8b4..d444c7e059 100644
--- a/package/lsscsi/lsscsi.hash
+++ b/package/lsscsi/lsscsi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15  lsscsi-0.30.tgz
-sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca  lsscsi-0.31.tgz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
index 70c5226d9b..e9a5255397 100644
--- a/package/lsscsi/lsscsi.mk
+++ b/package/lsscsi/lsscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSSCSI_VERSION = 0.30
+LSSCSI_VERSION = 0.31
 LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
 LSSCSI_SITE = http://sg.danny.cz/scsi
 LSSCSI_LICENSE = GPL-2.0+
