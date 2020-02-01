From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 00:17:29 +0100
Subject: [Buildroot] [git commit] package/fail2ban: bump to version 0.11.1
Message-ID: <20200201230707.3A40E88107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7a024372d7c5ccb48b8e078b08eddb5eaef1d15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump fail2ban to verison 0.11.1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 90a4287355..f807d5a82b 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  a665df6338cf836edd90d1c87dcef28c8cec1aaae5f72e3f2a45ecda89a7ba5f  fail2ban-0.10.5.tar.gz
+sha256  71d2a52b66bb0f87ac3812246bdd3819ec561913cd44afd39130a342f043aa6d  fail2ban-0.11.1.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0a8f3c6cfc..07c0c04787 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 0.10.5
+FAIL2BAN_VERSION = 0.11.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
