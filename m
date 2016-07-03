From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:41 +0200
Subject: [Buildroot] [PATCH v3 05/14] docs/manual: document dependency on
	fortran
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-6-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- new patch
---
 docs/manual/adding-packages-directory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index ee4a721..dc66f00 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -318,6 +318,10 @@ use in the comment.
 ** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
 ** Comment string: `C++`
 
+* Fortran support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_FORTRAN+
+** Comment string: `fortran`
+
 * thread support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
 ** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
-- 
2.9.0
