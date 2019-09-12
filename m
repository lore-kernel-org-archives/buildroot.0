From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 19:20:53 +0200
Subject: [Buildroot] [git commit] package/gawk: bump to version 5.0.1
Message-ID: <20190912171730.C96678E08E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5ffc43b21ca020c562baa1c38f2549d7fa141f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gawk/gawk.hash | 5 +++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index d8dd27c17c..f80f2b202a 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz.sig
-sha256	d1119785e746d46a8209d28b2de404a57f983aa48670f4e225531d3bdc175551	gawk-4.2.1.tar.xz
+# https://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz.sig
+# Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
+sha256 8e4e86f04ed789648b66f757329743a0d6dfb5294c3b91b756a474f1ce05a794 gawk-5.0.1.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 7c93aefed6..1a5f87f603 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.2.1
+GAWK_VERSION = 5.0.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
