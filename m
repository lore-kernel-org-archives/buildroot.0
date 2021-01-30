From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:37:37 +0100
Subject: [Buildroot] [git commit] package/rtty: bump version to 7.3.0
Message-ID: <20210130102238.3283883610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8efcd2ab2fa15a1b0f38e14f50535a4df812292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtty/rtty.hash | 2 +-
 package/rtty/rtty.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index f4fef5243f..a60bbd8b7e 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  067a2e0df9abb6d4419271ce6ecc47435824bc82205ad75bbf166e4259a7f9e2  rtty-7.2.3.tar.gz
+sha256  b0037d6af9f52fdc843b3463eefd52a40a091560d6a33e1abb3bb02fe68d349b  rtty-7.3.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index a78375297f..7fc0803239 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.2.3
+RTTY_VERSION = 7.3.0
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
