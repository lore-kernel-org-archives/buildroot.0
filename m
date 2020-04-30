From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 29 Apr 2020 19:43:33 -0500
Subject: [Buildroot] [PATCH] package/gawk: bump to version 5.1.0
Message-ID: <20200430004333.15221-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update hash file to two space format

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/gawk/gawk.hash | 6 +++---
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index f80f2b202a..91e506607e 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256 8e4e86f04ed789648b66f757329743a0d6dfb5294c3b91b756a474f1ce05a794 gawk-5.0.1.tar.xz
+sha256  cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd  gawk-5.1.0.tar.xz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 1a5f87f603..16906f6f93 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.0.1
+GAWK_VERSION = 5.1.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.17.1
