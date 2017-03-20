From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:57:33 +0100
Subject: [Buildroot] [git commit] package/x265: bump version to 2.3
Message-ID: <20170320205737.7474182189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60b4b2437649eb07516d52b76d80cd4bcc57e991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 5672d79..d53295c 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 b872552535e41fbffa03ba7cbcd3479c42c4053868309292e78e147b7773ac4b  x265_2.2.tar.gz
+sha256 47520ac3424790168ea5c2db4a3cf12ca4d55a1790720007916652f07af3e41f  x265_2.3.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 0fbdb01..498ceaa 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.2
+X265_VERSION = 2.3
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPLv2+
