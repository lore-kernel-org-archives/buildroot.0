From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Jan 2020 22:40:15 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: bump to version 0.11.1
Message-ID: <20200113214015.15632-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump fail2ban to verison 0.11.1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 25d120c115..f807d5a82b 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d6ca1bbc7e7944f7acb2ba7c1065953cd9837680bc4d175f30ed155c6a372449  fail2ban-0.10.4.tar.gz
+sha256  71d2a52b66bb0f87ac3812246bdd3819ec561913cd44afd39130a342f043aa6d  fail2ban-0.11.1.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a0325dffc5..07c0c04787 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 0.10.4
+FAIL2BAN_VERSION = 0.11.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
-- 
2.17.1
