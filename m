From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:23:56 +0200
Subject: [Buildroot] [git commit] uclibc: update hash for uClibc-ng 1.0.1
Message-ID: <20150403132416.1E0538194F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ead50a3d57445534d4bf360f39408ff2df479390
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/c2f/c2f5792bbe467556a394ff19e03ddb5f71251ac9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.hash |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 2a28855..69cc103 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -4,5 +4,5 @@ sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0
 # Locally calculated
 sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
 
-# http://downloads.uclibc-ng.org/releases/1.0.0/uClibc-ng-1.0.0.tar.xz.sha256
-sha256	56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1	uClibc-ng-1.0.0.tar.xz
+# From http://www.uclibc-ng.org/trac/
+sha256  e561040293ba4f21dcf3285ca1f683b5a8493eb0ffd3b3e495122cfde5a64a0e        uClibc-ng-1.0.1.tar.xz
