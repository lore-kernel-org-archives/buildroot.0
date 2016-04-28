From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 21:14:06 +0200
Subject: [Buildroot] [git commit] subversion: security bump to version 1.9.4
Message-ID: <20160428193042.88BA78198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cae3b0c0a4c6ed0b89ca64e9762e52831b27530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-2167 - svnserve/sasl may authenticate users using the wrong
realm.
CVE-2016-2168 - Remotely triggerable DoS vulnerability in mod_authz_svn
during COPY/MOVE authorization check.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 2 +-
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 4f0a446..926bbc5 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,2 @@
 # From http://subversion.apache.org/download.cgi#recommended-release
-sha1	27e8df191c92095f48314a415194ec37c682cbcf	subversion-1.9.3.tar.bz2
+sha1	bc7d51fdda43bea01e1272dfe9d23d0a9d6cd11c	subversion-1.9.4.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index e9aa0ae..720a1a1 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.3
+SUBVERSION_VERSION = 1.9.4
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
