From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:34:22 +0200
Subject: [Buildroot] [git commit] webp: bump to version 1.0.0
Message-ID: <20180930084530.B85B980FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3d66a308fa1424dd0837868da42674bd859b1dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index ffb63b8e2b..7dd954ef05 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	06503c782d9f151baa325591c3579c68ed700ffc62d4f5a32feead0ff017d8ab	libwebp-0.6.1.tar.gz
+sha256	84259c4388f18637af3c5a6361536d754a5394492f91be1abc2e981d4983225b	libwebp-1.0.0.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index f5ca34241f..30364743e9 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.6.1
+WEBP_VERSION = 1.0.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
