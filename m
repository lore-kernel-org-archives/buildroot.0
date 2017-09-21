From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 09:24:39 +0200
Subject: [Buildroot] [git commit] package/samba4: security bump to version
	4.6.8
Message-ID: <20170921084821.925DA810AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48fcf6eaec352019356ec5554b3b6519ddf2e50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.6.8.html

Fixes
- CVE-2017-12150 (SMB1/2/3 connections may not require signing where
  they should)
- CVE-2017-12151 (SMB3 connections don't keep encryption across DFS
  redirects)
- CVE-2017-12163 (Server memory information leak over SMB1)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 24e9ae1..19b175a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9ef24393de08390f236cabccd6a420b5cea304e959cbf1a99ff317325db3ddfa  samba-4.6.7.tar.gz
+sha256 581deeb2543f5cedcb556cb950d0e82690d9f0cd33811d76624502ca0c32575d  samba-4.6.8.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index fddd948..f8001bb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.7
+SAMBA4_VERSION = 4.6.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
