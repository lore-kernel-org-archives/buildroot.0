From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 May 2016 17:19:19 +0200
Subject: [Buildroot] [git commit] samba4: bump to version 4.4.3
Message-ID: <20160502152436.AE46A80767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31acaf78c56d730620cc6982a78c84711d06aaf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a few regressions from the previous security bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d762452..042c7db 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	eaecd41a85ebb9507b8db9856ada2a949376e9d53cf75664b5493658f6e5926a	samba-4.4.2.tar.gz
+sha256	031e6ada6d15deae6850845eed41497af32207fb679d6c6c74f19acc99d437ba	samba-4.4.3.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0d73662..9ccc6a7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.2
+SAMBA4_VERSION = 4.4.3
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
