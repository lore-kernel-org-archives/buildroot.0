From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 21:57:02 -0300
Subject: [Buildroot] [PATCH] unrar: bump to version 5.4.5
Message-ID: <1476320222-31029-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index e6a146c..36450e0 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	e4f05190d9e379449a04c22baffc24cc2f03164a4738befe601b1325440db0c6	unrarsrc-5.4.3.tar.gz
+sha256	e470c584332422893fb52e049f2cbd99e24dc6c6da971008b4e2ae4284f8796c	unrarsrc-5.4.5.tar.gz
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index e49fe6c..68d81b7 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.4.3
+UNRAR_VERSION = 5.4.5
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.7.3
