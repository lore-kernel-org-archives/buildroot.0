From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:30:09 +0100
Subject: [Buildroot] [git commit] uclibc: add hash for uclibc-ng
Message-ID: <20150304203109.40ACA7F913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39e08b1dd3f843ea3f5e0a10b4e6eb4c267de270
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: put comments near the relevant line.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.hash |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0fba41a..2a28855 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,8 @@
-# Locally calculated after checking pgp signature (vanilla)
-# Locally calculated (ARC)
+# Locally calculated after checking pgp signature
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
+
+# Locally calculated
 sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
+
+# http://downloads.uclibc-ng.org/releases/1.0.0/uClibc-ng-1.0.0.tar.xz.sha256
+sha256	56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1	uClibc-ng-1.0.0.tar.xz
