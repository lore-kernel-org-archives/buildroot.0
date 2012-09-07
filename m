From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:53 -0300
Subject: [Buildroot] [PATCH 06/10] grep: bump to version 2.14
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 4ed5fea..4a10fae 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-GREP_VERSION = 2.13
+GREP_VERSION = 2.14
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
+GREP_LICENSE = GPLv3
+GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-- 
1.7.8.6
