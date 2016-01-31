From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:33:39 +0100
Subject: [Buildroot] [git commit] package/subversion: security version bump
	to 1.9.3
Message-ID: <20160201224712.BB4437F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=544949e4987c177ebcfa76244c5383a2267ac240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announcement:
http://mail-archives.apache.org/mod_mbox/subversion-dev/201512.mbox/%3CCAP_GPNj_GCA869VQeJUrp5ngXsgN7pQQHSS=sqoXm8_6hHTTxg at mail.gmail.com%3E

CVE-2015-5259:
Remotely triggerable heap overflow and out-of-bounds read caused by
integer overflow in the svn:// protocol parser.
http://subversion.apache.org/security/CVE-2015-5259-advisory.txt

CVE-2015-5343:
Remotely triggerable heap overflow and out-of-bounds read in mod_dav_svn
caused by integer overflow when parsing skel-encoded request bodies.
http://subversion.apache.org/security/CVE-2015-5343-advisory.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/subversion/subversion.hash | 2 +-
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 7806374..4f0a446 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,2 @@
 # From http://subversion.apache.org/download.cgi#recommended-release
-sha1 fb9db3b7ddf48ae37aa8785872301b59bfcc7017 subversion-1.9.2.tar.bz2
+sha1	27e8df191c92095f48314a415194ec37c682cbcf	subversion-1.9.3.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 2f6a249..e9aa0ae 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.2
+SUBVERSION_VERSION = 1.9.3
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
