From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 14:40:09 -0300
Subject: [Buildroot] [PATCH 4/4] gettext: bump to version 0.19.5
In-Reply-To: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436550009-30590-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.hash | 6 +++---
 package/gettext/gettext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index db5a0ed..9860792 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2014-12/msg00038.html
-md5	997c9070354eff5517115feaea6038f0	gettext-0.19.4.tar.xz
-sha1	16c90342f3a59c7df364ebb3209a48be42b7ffd9	gettext-0.19.4.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2015-07/msg00004.html
+md5	546a8458f50e146be12c215f83b9bac2	gettext-0.19.5.tar.xz
+sha1	bfe50a885076a24d63b9d9b242a409cc16727d24	gettext-0.19.5.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index c2419c1..c9aaa6a 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.4
+GETTEXT_VERSION = 0.19.5
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-- 
2.3.6
