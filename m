From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 21:07:49 +0100
Subject: [Buildroot] [git commit] package/fail2ban: bump version to 0.10.5
Message-ID: <20200121200043.BA4E383467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2139a73a1f19a512fcca31ed151ba92c741bdc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 25d120c115..90a4287355 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d6ca1bbc7e7944f7acb2ba7c1065953cd9837680bc4d175f30ed155c6a372449  fail2ban-0.10.4.tar.gz
+sha256  a665df6338cf836edd90d1c87dcef28c8cec1aaae5f72e3f2a45ecda89a7ba5f  fail2ban-0.10.5.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a0325dffc5..0a8f3c6cfc 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 0.10.4
+FAIL2BAN_VERSION = 0.10.5
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
