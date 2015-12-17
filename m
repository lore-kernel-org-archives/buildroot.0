From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Dec 2015 07:59:18 -0300
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.3.3
Message-ID: <1450349958-14230-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-7540 - Remote DoS in Samba (AD) LDAP server
CVE-2015-3223 - Denial of service in Samba Active Directory server
CVE-2015-5252 - Insufficient symlink verification in smbd)
CVE-2015-5299 - Missing access control check in shadow copy code
CVE-2015-5296 - Samba client requesting encryption vulnerable to
downgrade attack
CVE-2015-8467 - Denial of service attack against Windows Active
Directory server
CVE-2015-5330 - Remote memory read in Samba LDAP server

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 2959e5b..494ad17 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	61989195caadf0f6fb51ce6bed5e203e6146facc2c276a26ad41901ad9129a75	samba-4.3.2.tar.gz
+sha256	e62d21313acbb29e24b0b80aaf2b63fdd1ccce4cfb741f333deca95a1a3a70df	samba-4.3.3.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 388a40c..50a2692 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.2
+SAMBA4_VERSION = 4.3.3
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.4.10
