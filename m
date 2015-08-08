From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:55:56 -0000
Subject: [Buildroot] [git commit branch/next] package/mono: adding hash file
Message-ID: <20150808105556.26C5D818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f238461622b5cb7285cb6aa7da046c212539061
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds the hash file for mono 4.0.0.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
new file mode 100644
index 0000000..c1d0c6e
--- /dev/null
+++ b/package/mono/mono.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 4485d8b44a939bef64b3b1b6a7f0388761cfe6803e149aa1e56aab023cfb267e  mono-4.0.0.tar.bz2
