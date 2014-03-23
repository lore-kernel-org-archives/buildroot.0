From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 20:54:15 +0100
Subject: [Buildroot] [git commit] manual/adding-packages-generic.txt: change
	the default value of <PKG>_SOURCE variable
Message-ID: <20140323195542.05B749C1CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99171b9fa5a2dcf3edb8e589bbaba6394b37094e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 366b896..e125498 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -211,7 +211,7 @@ information is (assuming the package name is +libfoo+) :
   the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
   defaults to +LIBFOO_SOURCE+. If none are specified, then
   the value is assumed to be
-  +packagename-$(LIBFOO_VERSION).tar.gz+. +
+  +libfoo-$(LIBFOO_VERSION).tar.gz+. +
   Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
 
 * +LIBFOO_PATCH+ may contain a space-separated list of patch file
