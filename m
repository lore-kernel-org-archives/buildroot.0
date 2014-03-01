From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:47:49 +0100
Subject: [Buildroot] [git commit] manual: document minimal kernel headers
	dependency
Message-ID: <20140301193723.6C5CE99374@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6395bf0927c790ea624c549effd6ab08c44277fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6145f54..e56e59a 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -218,6 +218,12 @@ use in the comment.
 ** Dependency symbol: +BR2_USE_MMU+
 ** Comment string: no comment to be added
 
+* Kernel headers
+** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
+   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
+** Comment string: +headers >= X.Y+ (replace +X.Y+ with the
+   proper version)
+
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
 +BR2_TOOLCHAIN_USES_UCLIBC+
