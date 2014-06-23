From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 16:19:51 +0200
Subject: [Buildroot] [git commit] samba4: security bump to version 4.1.9
Message-ID: <20140623142129.2BDD29D09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ba33f0cbb1017534f29461634e58ea62426815c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-0244 (Denial of service - CPU loop)
CVE-2014-3493 (Denial of service - Server crash/memory corruption)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a15ddb4..e2336e7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.8
+SAMBA4_VERSION = 4.1.9
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
