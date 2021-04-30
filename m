From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Apr 2021 14:53:16 +0200
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.19
Message-ID: <20210430122803.73A988677D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fea6712f5df2e5fe4255f7a6b297aa972bebfc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream typo fix:
https://sourceforge.net/p/fetchmail/git/ci/2409d4f0baa90c6303d1e600772e500fc397a561/

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37267719/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 8 ++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 698d83c88b..8f092a3f80 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37249830/
-sha256  302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f  fetchmail-6.4.18.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37267719/
+sha256  cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f  fetchmail-6.4.19.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  1fd3e4f30bd9ba7bdcaed5edfca080dc6f66377e  fetchmail-6.4.18.tar.xz
+sha1  bb6959f0cf1f6d689c2ba3834c5bba72e4f9ec07  fetchmail-6.4.19.tar.xz
 # Locally computed:
-sha256  8e3ec4863456a26fcd1cf84fadd4146efcb2fd8515bcec482e0f2b7060108895  COPYING
+sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 6fe9b5b3d7..7233da98a5 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).18
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).19
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
