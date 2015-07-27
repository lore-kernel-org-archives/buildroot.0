From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:52:51 +0200
Subject: [Buildroot] [git commit] lighttpd: bump to version 1.4.36
Message-ID: <20150727205259.AB2B97F8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a151706155c4e522cd1d3da39ff76dcb6676b00f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.hash |    2 +-
 package/lighttpd/lighttpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 01d3458..f74727c 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256	113e9b72ccbd1da5deb0774bf93cf0ca15dc82aad2da0f04e5ab27d37d3f30a3	lighttpd-1.4.35.tar.xz
+sha256	897ab6b1cc7bd51671f8af759e7846245fbbca0685c30017e93a5882a9ac1a53	lighttpd-1.4.36.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index d602556..c75eeff 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).35
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).36
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
