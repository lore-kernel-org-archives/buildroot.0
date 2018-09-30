From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:44:28 +0200
Subject: [Buildroot] [git commit] package/expedite: bump to the latest
 version
Message-ID: <20180930084531.4874F88E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d39d1df19bb05d2cc655229390bf6efdfb5daac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it add license file hash.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expedite/expedite.hash | 3 ++-
 package/expedite/expedite.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
index 828ee0553b..d813cb38c3 100644
--- a/package/expedite/expedite.hash
+++ b/package/expedite/expedite.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 56e1dbd9826d932f0ef72a10dfdf32b6e0f680ab6830f8a8cfc60644ac69dbf1 expedite-e7b11dd328d9db82b49cde795944a721beaf0112.tar.gz
+sha256 5f621a3cb70fae943893e256722cc7f7b0c4357035da7cc3cbbbb83e4ec1eb9a expedite-6a69955e71a00a720e1b0a9bc7b64dd3dd5673db.tar.gz
+sha256 0f024d9d9ddd18f94a4800d72e72d2ca198e9479c02b21afb9cacc2923ef2f2b COPYING
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 6bd4b007ba..fbcc4b5675 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = e7b11dd328d9db82b49cde795944a721beaf0112
+EXPEDITE_VERSION = 6a69955e71a00a720e1b0a9bc7b64dd3dd5673db
 EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
 EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2-Clause
