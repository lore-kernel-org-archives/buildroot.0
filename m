From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:41:41 +0200
Subject: [Buildroot] [git commit] iw: add hash
Message-ID: <20140918195021.0B06F9D6DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4fb7fb7eefeec71cde2bb58148cb2333df19b8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iw/iw.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
new file mode 100644
index 0000000..a635646
--- /dev/null
+++ b/package/iw/iw.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
+sha256	bd5c0a92cea799e22bcf431dfe0f91a3ba293ce078e9d95e53d7dbb26df24b8a	iw-3.15.tar.xz
