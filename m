From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:50:53 +0200
Subject: [Buildroot] [git commit] uclibc: update hash for arc
Message-ID: <20150425095655.09B3080094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3449a6ee4a897411d56b87a1caf65fbc8a0520e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old hash for 2014.08 was never updated. Since uclibc-arc-2014.12 is
downloaded from the github helper, it is converted into a 'none' hash.

Reordered the hashes so the none-hashes are together.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.hash |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 729c643..fe60291 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
-# Locally calculated
-sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
-
 # From http://www.uclibc-ng.org/trac/
 sha256  7e92e99995daa634cbdc63c297784df6e8fe39cc1d3bbd2d37eb5c3ced8a86e5        uClibc-ng-1.0.2.tar.xz
 
+# No hash for the ARC variant, comes from the github-helper
+none	xxx	uClibc-arc-2014.12.tar.gz
+
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
