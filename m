From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 09:42:07 +0100
Subject: [Buildroot] [git commit] python-typing: rewrap Config.in help text
Message-ID: <20181031084048.4591C83738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=074ca5a45ebd5ddc4238a15d61d7199ef3f8351c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/python-typing/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-typing/Config.in b/package/python-typing/Config.in
index d5350bccd0..81b7d71b4b 100644
--- a/package/python-typing/Config.in
+++ b/package/python-typing/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_TYPING
 	bool "python-typing"
 	depends on BR2_PACKAGE_PYTHON
 	help
-	  Type Hints for Python. This is a backport of the standard library
-	  typing module to Python versions older than 3.5.
+	  Type Hints for Python. This is a backport of the standard
+	  library typing module to Python versions older than 3.5.
 
 	  https://docs.python.org/3/library/typing.html
