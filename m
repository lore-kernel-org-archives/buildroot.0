From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:55:56 -0000
Subject: [Buildroot] [git commit branch/next] package/monolite: adding hash
	file
Message-ID: <20150808105556.2F11981801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fc2e8ec65ec152bcffcefb78c08cf4fb779a6fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds hash file for monolite version 117.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monolite/monolite.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
new file mode 100644
index 0000000..1139c0a
--- /dev/null
+++ b/package/monolite/monolite.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 07a8573feef0053ec28b98355feba8c83dcfb3f99c2d0913a16a287382daf4b8  monolite-117-latest.tar.gz
