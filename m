From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Jul 2012 10:47:45 -0300
Subject: [Buildroot] [PATCH 6/6] grep: bump to version 2.13
In-Reply-To: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
References: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1342360065-10106-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 389aa3b..31ccaa6 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GREP_VERSION = 2.12
+GREP_VERSION = 2.13
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
-- 
1.7.8.6
