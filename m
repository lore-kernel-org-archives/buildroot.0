From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 22:25:24 +0100
Subject: [Buildroot] [git commit] lighttpd: security bump to version 1.4.35
Message-ID: <20140312212628.4774A8F006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93ebbe3a35165f081992fbcff6d8fc9d7b4db9f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes lighttpd SA-2014-01 (CVE not assigned yet).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 375f934d..e1b9d79 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).34
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).35
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
