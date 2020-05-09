From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 22:36:57 +0200
Subject: [Buildroot] [git commit] package/python-attrs: fix typo in hash file
Message-ID: <20200509202151.EB8FB91230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e86a6ab35a9d58440bede427d3f826c2020eabe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'computer' -> 'computed'.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-attrs/python-attrs.hash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index f8c38ee4ed..3841595754 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5	5b2db50fcc31be34d32798183c9bd062  attrs-19.3.0.tar.gz
-sha256	f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72  attrs-19.3.0.tar.gz
-# Locally computer sha256
-sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
+md5  5b2db50fcc31be34d32798183c9bd062  attrs-19.3.0.tar.gz
+sha256  f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72  attrs-19.3.0.tar.gz
+# Locally computed sha256
+sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
