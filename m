From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:42:10 +0200
Subject: [Buildroot] [git commit] samba4: bump to version 4.4.7
Message-ID: <20161027084254.3EC427FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=048ec8ae4cf67ec88bef3dec9b2ef354e8f3c85a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e48d5c8..d6433f7 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	37c423dd590c63099d952b06c07bf399da7cc6c2e72739b831eedd7dbe8cc18c	samba-4.4.6.tar.gz
+sha256	a69d6612e4a421640242ca66c4dbb0e4c20281e77dc24970a332770814d45c7c	samba-4.4.7.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6d84f53..71cb426 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.6
+SAMBA4_VERSION = 4.4.7
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
