From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:54:39 +0100
Subject: [Buildroot] [git commit] package/icu: bump version to 60.2
Message-ID: <20180324105507.BA3EF81524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f43a26453b02ee158d64ea4db3b9ce546d020a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 8b54e22443..66a0a8dc80 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
-# From http://download.icu-project.org/files/icu4c/60.1/SHASUM512.txt
-sha512 a6798f70add1b3bac2197a49e09a0bb636279af7019ce572f63a30ab713e09657ee9d9b20aac7ea806fbb84667ca2eca981411e5053b47c3c705aa496a669233  icu4c-60_1-src.tgz
+# From http://download.icu-project.org/files/icu4c/60.2/SHASUM512.txt
+sha512 8e718e66c13e7f25714404c46b91ed6305efff1df70c328be2ec743023a7719016dae72a5fa0a05d6f5599983590a2044ff72d3453a048d987ab546d0416d694  icu4c-60_2-src.tgz
 sha256 24c771ce37201a3ab604852e47d10d21595d0493269dd6c8a5e567e998e18c00  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 6ac4a25378..a9466c8322 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 60.1
+ICU_VERSION = 60.2
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
