From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Apr 2014 22:29:00 +0200
Subject: [Buildroot] [git commit] filemq: bump git snapshot
Message-ID: <20140427203319.B81269C210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d00d1bdeb5b7338c27bb12d0775b6dc1d52e4770
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For API compatibility with czmq version 2.2.0.

Fixes:
http://autobuild.buildroot.net/results/971/971e2f88a533cc829516b1cf426f6b1c27d0d82b/

Also, switch to github helper.

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/filemq/filemq.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 8cf69bc..69469c6 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = c398c096a427d341e9323d7673e6e0ca5e43902a
-FILEMQ_SITE = git://github.com/zeromq/filemq.git
+FILEMQ_VERSION = 9a24134d4c0a84abc5eebf1dfb2eb184adee72df
+FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = fmq_have_asciidoc=no
