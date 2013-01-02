From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jan 2013 10:47:02 -0300
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.13
Message-ID: <1357134422-18037-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-6085.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg/gnupg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index e63c33c..7c25ad1 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUPG_VERSION = 1.4.12
+GNUPG_VERSION = 1.4.13
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
-- 
1.7.8.6
