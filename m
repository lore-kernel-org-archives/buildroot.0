From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:06:44 +0200
Subject: [Buildroot] [git commit] docs/manual: enhance doc for
	BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
Message-ID: <20140727130658.C54E09D2E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa0c8be4e2f4717f4d7156eaa63a42ae7abaa171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y symbols can be used to denote the
lowest required kernel headers version, but also the highest supported
version. Document that.

Use the `...` construct instead of +...+ used eveywhere else, otherwise
asciidoc would render +<=+ to the ??? arrow, while `...` does no rendering
at all.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c2f0a1a..93e6a3e 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -222,8 +222,8 @@ use in the comment.
 * Kernel headers
 ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
    +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
-** Comment string: +headers >= X.Y+ (replace +X.Y+ with the
-   proper version)
+** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
+   +X.Y+ with the proper version)
 
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
