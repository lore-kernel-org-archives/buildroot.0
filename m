From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:42:52 +0200
Subject: [Buildroot] [git commit] cloop: add license information
Message-ID: <20140709134616.634619CF0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=178d56c186dfa45b217ffa5bfb6b704f8f9ba448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: clarify that advancecomp is GPLv2+, add COPYING]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cloop/cloop.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index adbd69a..c36a2ad 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -7,6 +7,8 @@
 CLOOP_VERSION = 2.634-1
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.gz
 CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
+CLOOP_LICENSE = GPLv2 (module), GPLv2+ (advancecomp)
+CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
 HOST_CLOOP_DEPENDENCIES = host-zlib
 
