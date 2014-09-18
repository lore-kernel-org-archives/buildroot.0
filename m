From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:41:21 +0200
Subject: [Buildroot] [git commit] util-linux: add hash
Message-ID: <20140918195021.048299D6DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef9ad565b6fe133f7d28a437058f0d1eda4da8c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
new file mode 100644
index 0000000..cfa1364
--- /dev/null
+++ b/package/util-linux/util-linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.25/sha256sums.asc
+sha256	4701305ae22790c3a92ce48e50794fa05b7ee01f4227f419a171c100d08986e8	util-linux-2.25.1.tar.xz
