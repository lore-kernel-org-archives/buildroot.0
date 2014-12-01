From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:07:57 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.1.14
Message-ID: <20141201190932.773197FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af3d4b7d2afb64ca236c03a3e57e2b31b929c2f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index b263bd8..e6990bd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	737907f4ed3a71f6ec12638387aff7cda4764f8c2eb18deeca16e2fb7ed66c9f	samba-4.1.13.tar.gz
+sha256	5ea14baaca997292355d368918879e3d639def92b54efef2279cf5abe8db2cba	samba-4.1.14.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c4613f1..3ac0325 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.13
+SAMBA4_VERSION = 4.1.14
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
