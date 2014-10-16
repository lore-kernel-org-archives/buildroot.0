From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 07:10:41 +0200
Subject: [Buildroot] [git commit] kmod: add hash file
Message-ID: <20141016060905.899409D858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=480b8c7f67d63bb24df36b0a9508a19ca55cc032
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
new file mode 100644
index 0000000..8244fd9
--- /dev/null
+++ b/package/kmod/kmod.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
+sha256	e16e57272b54acb219c465b334715cfdddb5d97ff5d8948d4830ca1a372a868e	kmod-18.tar.xz
