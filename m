From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 19:27:44 +0200
Subject: [Buildroot] [git commit] toolchain: add support for D language
Message-ID: <20191025172118.3598188012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fb9f80cc56031f3129d852493ffcfb6c818619f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 9.1, GCC provides support for the D programming language [1].

So add an option to indicate the selected toolchain supports this
language.

[1] https://dlang.org/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3bc3b1b4b0..c9aa95985f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -171,6 +171,9 @@ config BR2_ENABLE_LOCALE
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
+config BR2_TOOLCHAIN_HAS_DLANG
+	bool
+
 config BR2_TOOLCHAIN_HAS_FORTRAN
 	bool
 
