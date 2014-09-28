From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 18:26:27 +0200
Subject: [Buildroot] [PATCH 1/4] docs/manual: add musl to toolchain
	dependency options
In-Reply-To: <cover.1411921550.git.yann.morin.1998@free.fr>
References: <cover.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <2ae3131118cfc155a94a2abf49d5bcdf3b5dba99.1411921550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only document (e)glibc and uClibc as C libraries on which
we can depend. However, we've supported musl for quite some time now.

So, also refference it in the manual, when dealing with toolchain
options a pa ckage may have to depend on.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index fd9460c..2e259ba 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -232,7 +232,7 @@ use in the comment.
 
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
-   +BR2_TOOLCHAIN_USES_UCLIBC+
+   +BR2_TOOLCHAIN_USES_UCLIBC+, +BR2_TOOLCHAIN_USES_MUSL+
 ** Comment string: for the C library, a slightly different comment text
    is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
    toolchain w/ C++`
-- 
1.9.1
