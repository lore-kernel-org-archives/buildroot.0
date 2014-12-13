From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:40:22 +0100
Subject: [Buildroot] [git commit] boa: add a hash file
Message-ID: <20141213214904.B48717FE28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=768a0eb7910acc502cb3f0e6329a708cda899af6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will clarify errors like this one:
  http://autobuild.buildroot.net/results/b71/b71084d67d33e80cde9478dcf5a89511479cb95e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boa/boa.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/boa/boa.hash b/package/boa/boa.hash
new file mode 100644
index 0000000..37760fd
--- /dev/null
+++ b/package/boa/boa.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  02c51bf25f29d56e641b662f0767759654c28d88ec31f55c5a73d57edfe13cf6  boa-0.94.14rc21.tar.gz
