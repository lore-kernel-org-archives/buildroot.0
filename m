From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 11:02:58 +0200
Subject: [Buildroot] [git commit] socat: bump to version 2.0.0-b6
Message-ID: <20131006105631.DD3B99B88B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6b103f6538de3e13d7c3098a498562e629a31f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.0.0-b6 fix a security issue:
Under certain circumstances an FD leak occurs and may be misused for denial of
service attacks against socat running in server mode.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 8ba399b..df60961 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b5
+SOCAT_VERSION = 2.0.0-b6
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_LICENSE = GPLv2
