From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:23:18 +0100
Subject: [Buildroot] [git commit] fconfig: add hash file
Message-ID: <20141207202324.68123800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2bdc53c8cd513d42e7503bccd48433813a38dea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add locally computed hash file for fconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/fconfig/fconfig.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fconfig/fconfig.hash b/package/fconfig/fconfig.hash
new file mode 100644
index 0000000..eae26e2
--- /dev/null
+++ b/package/fconfig/fconfig.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7 fconfig-20080329.tar.gz
