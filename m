From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Nov 2010 10:45:03 +0100
Subject: [Buildroot] [git commit master 1/1] bind: security bump to 9.5.2-p4
Message-ID: <20101119094525.1AC828D2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa59aeb6b5efda44f5f6f93a913cbda9d6a15576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    5 +++--
 package/bind/bind.mk |    4 +---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index c3b3a6f..5bd7483 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,9 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: bash, busybox, libglib2, libmad, midori,
-	module-init-tools, mtd-utils, openssh, qt, sqlite, webkit
+	Updated/fixed packages: bash, bind, busybox, libglib2, libmad,
+	midori, module-init-tools, mtd-utils, openssh, qt, sqlite,
+	webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2434086..f402ad1 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,10 +4,8 @@
 #
 #############################################################
 
-BIND_VERSION = 9.5.2-P2
+BIND_VERSION = 9.5.2-P4
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
-BIND_LIBTOOL_PATCH = NO
-BIND_INSTALL_STAGING = NO
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
 BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen
 BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone
-- 
1.7.2.2
