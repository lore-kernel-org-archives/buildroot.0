From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 21:04:44 +1300
Subject: [Buildroot] [git commit] webp: bump to version 0.5.2
Message-ID: <20170125080451.DB34981F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae13d3fdffacf7fb111ac717b97f2ae432d89a08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 328f263..bf4ee8f 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4	libwebp-0.4.3.tar.gz
+sha256	b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef	libwebp-0.5.2.tar.gz
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 8d9ca8f..d579d56 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.4.3
+WEBP_VERSION = 0.5.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3c
