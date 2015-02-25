From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 19:49:21 +0100
Subject: [Buildroot] [git commit] libao: add hash
Message-ID: <20150225185524.0478E805B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6b985be3035367abbcd0bce0e1f124af2544ed7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libao/libao.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libao/libao.hash b/package/libao/libao.hash
new file mode 100644
index 0000000..64174da
--- /dev/null
+++ b/package/libao/libao.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
+sha256	03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf	libao-1.2.0.tar.gz
