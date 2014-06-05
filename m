From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:26:56 +0200
Subject: [Buildroot] [git commit] Bump live555 to 2014.05.27
Message-ID: <20140605201506.C44A99CEE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=297fefa4baef83a8d7048d2e01705def988e60dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update live555 to newer version

Signed-off-by: xxiao <xxiao8@fosiao.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 756bec6..8b2ac10 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2014.01.11
+LIVE555_VERSION = 2014.05.27
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public/
 LIVE555_LICENSE = LGPLv2.1+
