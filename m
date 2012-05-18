From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:21:33 +0200
Subject: [Buildroot] [git commit] grep: bump to version 2.12
Message-ID: <20120531113257.E05C296E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa529d101b472ff926f8211b39d9f3280155e371
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index aa22910..389aa3b 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GREP_VERSION = 2.11
+GREP_VERSION = 2.12
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
