From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 19:48:58 +0100
Subject: [Buildroot] [git commit] opus: add hash
Message-ID: <20150225185523.F0F1480E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c07a1bd12244c6ca8caab82f39134dd63f090401
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
new file mode 100644
index 0000000..9c4e34d
--- /dev/null
+++ b/package/opus/opus.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256	b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95	opus-1.1.tar.gz
