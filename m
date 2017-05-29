From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:17:23 +0200
Subject: [Buildroot] [git commit] package/samba4: security bump to version
	4.5.10
Message-ID: <20170529211727.BFFDB82A0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12687c5c76f8f82da0815b6ff1607494ee7180b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-7494:
https://www.samba.org/samba/history/samba-4.5.10.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0a2a548..a16d834 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f63b656d8823a280c50c9dbd6b692816cd7a88adfe9b47997ce697fd75bf81f0  samba-4.5.8.tar.gz
+sha256 7cb753f5f6d5527ef40d4c1f47dacafb7c876cb304b4906ccb390c6a18477714  samba-4.5.10.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4de69a0..93c45da 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.8
+SAMBA4_VERSION = 4.5.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
