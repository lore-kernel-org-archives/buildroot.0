From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 23:03:13 +0100
Subject: [Buildroot] [git commit] Introduce /run directory
Message-ID: <20120202220402.45A05909A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c3e2cbb53b0383f5b273a0a0c908b8b232d1072
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/run |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/run b/fs/skeleton/run
new file mode 120000
index 0000000..1c2f433
--- /dev/null
+++ b/fs/skeleton/run
@@ -0,0 +1 @@
+tmp
\ No newline at end of file
