From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Jan 2015 07:53:31 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.15
Message-ID: <1421060011-4212-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e6990bd..bd6f6e9 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5ea14baaca997292355d368918879e3d639def92b54efef2279cf5abe8db2cba	samba-4.1.14.tar.gz
+sha256	9d84112124512428ddc9cc0d9975524bab730b9a598a9ff90458666afb3f42f4	samba-4.1.15.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3ac0325..4a2f207 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.14
+SAMBA4_VERSION = 4.1.15
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
2.0.5
