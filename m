From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:58:15 +0200
Subject: [Buildroot] [git commit] manual: document dependencies on atomic
	operations
Message-ID: <20140818090640.1A4BB9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a30b868de6cc147335ce506833ac0848a517e912
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add atomic operations to the list of generic dependencies.

Since this is an architecture option, there is no comment string to be
added.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new arch-option; remove comment string]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 93e6a3e..fd9460c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -219,6 +219,11 @@ use in the comment.
 ** Dependency symbol: +BR2_USE_MMU+
 ** Comment string: no comment to be added
 
+* Atomic instructions (whereby the architecture has instructions to
+  perform some operations atomically, like LOCKCMPXCHG on x86)
+** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
+** Comment string: no comment to be added
+
 * Kernel headers
 ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
    +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
