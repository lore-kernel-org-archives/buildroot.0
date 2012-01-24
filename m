From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2012 13:29:07 -0300
Subject: [Buildroot] [PATCH 3/4] grep: bump to version 2.10
In-Reply-To: <1327422548-20906-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327422548-20906-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327422548-20906-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
1.7.3.4
