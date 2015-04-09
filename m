From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 22:48:21 +0200
Subject: [Buildroot] [git commit] docs/manual: add _PATCH_DEPENDENCIES
Message-ID: <20150409211053.7615481963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=677c4b5f9763e6d3380b9f149de36a674b559eda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1aa6def..8cf6bb6 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -308,6 +308,15 @@ information is (assuming the package name is +libfoo+) :
   a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
   the current host package.
 
+* +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
+  package name) that are required for the current package to be
+  patched. These dependencies are guaranteed to be extracted and
+  patched before the current package is patched. In a similar way,
+  +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies for the
+  current host package.
+  This is seldom used; usually, +LIBFOO_DEPENDENCIES+ is what you
+  really want to use.
+
 * +LIBFOO_PROVIDES+ lists all the virtual packages +libfoo+ is an
   implementation of. See xref:virtual-package-tutorial[].
 
