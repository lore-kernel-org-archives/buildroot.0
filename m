From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:22:04 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] sqlite: bump to version
 3.25.2
Message-ID: <20190123143025.AFCB08E290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d43424565fe0853ac8fa97ff7a7b7e27a4462f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5a5102c428d98d79e2b4eeba5226a7c824a1fb66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 4c67e9a00c..eefa31ffb7 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 1d494ca2355ffe8ddbeea7cf615ef61122fe421e  sqlite-autoconf-3250100.tar.gz
+sha1 aedfbdc14eb700099434d6a743135743cff47393  sqlite-autoconf-3250200.tar.gz
 # Calculated based on the hash above
-sha256 96ed46bd87f093073ca8afd613020def847009b611c89f397bc24bd932ec6fd1  sqlite-autoconf-3250100.tar.gz
+sha256 da9a1484423d524d3ac793af518cdf870c8255d209e369bd6a193e9f9d0e3181  sqlite-autoconf-3250200.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 21fc22b59b..9911be6916 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3250100
+SQLITE_VERSION = 3250200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2018
 SQLITE_LICENSE = Public domain
