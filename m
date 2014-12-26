From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 13:45:36 +0100
Subject: [Buildroot] [git commit] package/guile: needs libtool
Message-ID: <20141226141335.4DAAA80766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ec563a6aeef9af8e05c823c66afc9fa2f1014d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

guile build-depends on libtool, but forgot to select it Kconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index 8f86e9f..6859caf 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBTOOL
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
