From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:44:13 +0200
Subject: [Buildroot] [git commit] iproute2: add hash
Message-ID: <20140918195021.2B9E49D6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d19a9f2667c2b5cd574359f2964511a79388e472
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
new file mode 100644
index 0000000..5a8e6ca
--- /dev/null
+++ b/package/iproute2/iproute2.hash
@@ -0,0 +1,2 @@
+# From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
+sha256	1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79	iproute2-3.16.0.tar.xz
