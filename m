From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Sep 2012 22:48:08 +0200
Subject: [Buildroot] [git commit] grep: bump to version 2.14
Message-ID: <20120909210324.6F26999590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=676cec3591dd059ebb03bf7f8d92840930fd9329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv3+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 4ed5fea..a02fe2c 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-GREP_VERSION = 2.13
+GREP_VERSION = 2.14
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
+GREP_LICENSE = GPLv3+
+GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
