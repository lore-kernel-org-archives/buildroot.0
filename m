From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:03 +0100
Subject: [Buildroot] [PATCH 08/13] manual: document minimal kernel headers
	dependency
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <09213fecb2225b853b88007a6ea9197952d970a2.1393685422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - fix typo  (Samuel)
  - fix asciidoc syntax  (Thomas DS)
---
 docs/manual/adding-packages-directory.txt | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
1.8.3.2
