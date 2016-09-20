From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 12:01:36 -0300
Subject: [Buildroot] [PATCH 7/7] vala: bump to version 0.34.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474383696-4045-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 4a4a41c..b8d47a6 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.32/vala-0.32.1.sha256sum
-sha256	dd0d47e548a34cfb1e4b04149acd082a86414c49057ffb79902eb9a508a161a9	vala-0.32.1.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.0.sha256sum
+sha256	5d59e1ad4c59debc83687b593345a3cf9ef2e9020354145e59a188de4348f455	vala-0.34.0.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 4cdc0d7..2a4d257 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.32
-VALA_VERSION = $(VALA_VERSION_MAJOR).1
+VALA_VERSION_MAJOR = 0.34
+VALA_VERSION = $(VALA_VERSION_MAJOR).0
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.7.3
