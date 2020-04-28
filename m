From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 19:17:54 +0200
Subject: [Buildroot] [git commit] docs: adding-packages-python: don't
 mention distutilscross
Message-ID: <20200428170434.1BC7A90A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427697f29731fd83494d1e1e0e4a5d04b64f4592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package was removed a long time ago.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-python.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 74e2e78b29..0c100859be 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -98,10 +98,9 @@ Note that:
    dependencies are automatically added as needed by the Python
    package infrastructure.
 
- * Similarly, it is not needed to add +host-setuptools+ and/or
-   +host-distutilscross+ dependencies to +PYTHON_FOO_DEPENDENCIES+ for
-   setuptools-based packages, since these are automatically added by
-   the Python infrastructure as needed.
+ * Similarly, it is not needed to add +host-setuptools+ to
+   +PYTHON_FOO_DEPENDENCIES+ for setuptools-based packages, since it's
+   automatically added by the Python infrastructure as needed.
 
 One variable specific to the Python infrastructure is mandatory:
 
