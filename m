From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:22:17 +0200
Subject: [Buildroot] [git commit] package/fetchmail: bump version to
 6.4.0.rc1
Message-ID: <20190806201954.31D0D8E4CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36cee85809af607d9ec25bc26a5c1a35a1c4e2c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after upstream commit:
https://sourceforge.net/p/fetchmail/git/ci/c58fae843fbcbd3c1040a7fbc2196fbc758cc186/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 1a9499ab29..e215781d8a 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 832fded80908670d0ae31b4ac4a4e292d4fdb1855578bb9ac0e9e2f63efa5a39  fetchmail-6.4.0.beta5.tar.xz
-sha256 8b9e9688c0fc566adfa56f9d9ebaabf60e5a58ca365a282cf5742bd22fd97378  COPYING
+sha256 8b6c7c113b58ca32b3041375bdab4b2e4e6e98c975e1365de5e51f63ef07bf2e  fetchmail-6.4.0.rc1.tar.xz
+sha256 678189d91119286a3499874421006bb81f49b13eff8e1223115ce1b07e7ed0e7  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index c008cd2c7c..1d3918ac90 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0.beta5
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0.rc1
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
