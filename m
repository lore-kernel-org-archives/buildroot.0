From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:23:31 +0100
Subject: [Buildroot] [git commit] package/strace: bump version to 5.10
Message-ID: <20201223120721.1D92A88023@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80c86af749029d9108b408b7b6cf9b4d796f6700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://strace.io/files/5.10

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 58df21fdd9..7b211c78b9 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.9/strace-5.9.tar.xz.asc
-sha256  39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9  strace-5.9.tar.xz
+# https://strace.io/files/5.10/strace-5.10.tar.xz.asc
+sha256  fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c  strace-5.10.tar.xz
 sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0bc97b4042..6ec3c2c068 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.9
+STRACE_VERSION = 5.10
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
