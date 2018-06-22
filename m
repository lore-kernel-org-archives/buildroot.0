From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 11:42:48 +0200
Subject: [Buildroot] [git commit] strace: bump to version 4.23
Message-ID: <20180622094418.8B8F78155C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6076a40cd59d7b1f26162d46b670349693532854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add reference to tarball signature verification key.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f50e89c060..c6450b1c51 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking signature
-# https://strace.io/files/4.22/strace-4.22.tar.xz.asc
-sha256	068cd09264c95e4d591bbcd3ea08f99a693ed8663cd5169b0fdad72eb5bdb39d	strace-4.22.tar.xz
+# Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
+# https://strace.io/files/4.23/strace-4.23.tar.xz
+sha256	7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad	strace-4.23.tar.xz
 sha256	df862ba273812c589fd69acc74197a25d38c5295baccab00a62d39d1894c0253	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 4af01b9928..471dbc2e1d 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.22
+STRACE_VERSION = 4.23
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
