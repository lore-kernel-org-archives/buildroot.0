From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:29:23 +0200
Subject: [Buildroot] [git commit] rt-tests: remove occurrence of eglibc
Message-ID: <20160628203005.B8C8C82037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05ad387fc0a2399af796739879cfdb38908f02a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 4c57c0f..96e0bad 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -15,9 +15,9 @@ config BR2_PACKAGE_RT_TESTS
 
 	  Note that this package requires a toolchain built with the
 	  NPTL implementation of the pthread API (this is always the
-	  case with glibc/eglibc toolchains, but may not necessarily
-	  be the case with uClibc toolchains, since the thread
-	  implementation is configurable).
+	  case with glibc toolchains, but may not necessarily be the
+	  case with uClibc toolchains, since the thread implementation
+	  is configurable).
 
 	  http://rt.wiki.kernel.org
 
