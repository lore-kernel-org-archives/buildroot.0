From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:34:04 +0100
Subject: [Buildroot] [git commit branch/next] gnupg2: bump to version 2.0.27
Message-ID: <20150220183411.9489A817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=270c1cbb0fa36ffbf2645c117d0557ee3be11ae3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash |    2 +-
 package/gnupg2/gnupg2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 62fdaee..e1512c2 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0	gnupg-2.0.26.tar.bz2
+sha256	57646d3e4b919fa1e5c8f1c0cf5fe1215333041c493a5ebc4b8f2978dbe930f2	gnupg-2.0.27.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2d133aa..aa35c36 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.26
+GNUPG2_VERSION = 2.0.27
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
