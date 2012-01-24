From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 23:40:49 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.10
Message-ID: <20120124225256.BF0FC90392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce7a7896c5cdc4ecc6a5ca16f9403c57d0a329f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index e039135..a4391d7 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,8 +4,9 @@
 #
 #############################################################
 
-GREP_VERSION = 2.9
+GREP_VERSION = 2.10
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
+GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
