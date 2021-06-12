From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:25:24 +0200
Subject: [Buildroot] [git commit] package/python-pymupdf: fix tarball name
 for sha256
Message-ID: <20210612205456.9B78284196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c920f0d9b6217dcfde59b6f79e764a9a7f0a5890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix tarball name for sha256 which is wrong since the addition of the
package in commit 71f7fc8a27af383d3307945bf6e880491cb74bd4

While at it, also update indentation to 2 spaces

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 6729c6b91b..a5a53997cd 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5	0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
-sha256	1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  python-pymupdf-1.16.0.tar.gz
+md5  0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
+sha256  1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  PyMuPDF-1.16.0.tar.gz
