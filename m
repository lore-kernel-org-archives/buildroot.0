From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:56:34 +0200
Subject: [Buildroot] [git commit] nano: bump to version 2.3.2
Message-ID: <20131009202219.A52D09B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0286ed56c1d07cab85188fea68f9022925d7c4b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index b1a8f44..aba4b4f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.3.1
+NANO_VERSION = 2.3.2
 NANO_SITE = http://www.nano-editor.org/dist/v2.3
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
