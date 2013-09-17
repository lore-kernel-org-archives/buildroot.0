From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 17:39:15 +0200
Subject: [Buildroot] [git commit] dash: bump to version 0.5.7-3
Message-ID: <20130917154313.C8C6D9B7BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab782560690a960200951bb0131536ce853731fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to patchlevel 3 since 2 is gone upstream, fixes when
sources.buildroot.net isn't available:
http://autobuild.buildroot.net/results/5ee/5ee6544a9d08025060cb5806870ae1c3f252cd93/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dash/dash.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index c6a8b11..970286d 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -7,7 +7,7 @@
 DASH_VERSION = 0.5.7
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
-DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz
+DASH_PATCH = dash_$(DASH_VERSION)-3.diff.gz
 DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
