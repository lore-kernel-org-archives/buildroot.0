From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:30:52 +0100
Subject: [Buildroot] [git commit branch/next] ifupdown: bump to version
	0.8.10
Message-ID: <20160224223213.6AB47818DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca923bd18495b60c1c782b1cb8dca40b7020f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifupdown/ifupdown.hash | 4 ++--
 package/ifupdown/ifupdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index c5a4189..cd180ad 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.8.dsc
-sha256	180edaaa6de99e4e74de7229481edf74361b8e8468462842618a42a952a26c0e	ifupdown_0.8.8.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.10.dsc
+sha256	d4730441b9234e5dcaab7dd688ad48ec17e130d1534a357b1c4fff13cf741b0c	ifupdown_0.8.10.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 37aaf5d..1421a67 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.8
+IFUPDOWN_VERSION = 0.8.10
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160113T035819Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160122T224509Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPLv2+
 IFUPDOWN_LICENSE_FILES = COPYING
