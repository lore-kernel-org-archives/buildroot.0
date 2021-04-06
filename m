From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 22:09:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: bump to version 0.11.2
Message-ID: <20210406200910.1280756-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/fail2ban/fail2ban/blob/0.11.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index f807d5a82b..072f0ef961 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  71d2a52b66bb0f87ac3812246bdd3819ec561913cd44afd39130a342f043aa6d  fail2ban-0.11.1.tar.gz
+sha256  383108e5f8644cefb288537950923b7520f642e7e114efb843f6e7ea9268b1e0  fail2ban-0.11.2.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index d2fe19d11e..0e465e9c0b 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 0.11.1
+FAIL2BAN_VERSION = 0.11.2
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
-- 
2.30.2
