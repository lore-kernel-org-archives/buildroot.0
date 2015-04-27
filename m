From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 00:26:47 +0200
Subject: [Buildroot] [git commit] python3: add hash file
Message-ID: <20150427222741.2600B7FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a692a251d4d26753142938e48c18d58d11f51e41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
new file mode 100644
index 0000000..60ac230
--- /dev/null
+++ b/package/python3/python3.hash
@@ -0,0 +1,4 @@
+# From https://www.python.org/downloads/release/python-343/
+md5 7d092d1bba6e17f0d9bd21b49e441dd5 Python-3.4.3.tar.xz
+# Locally computed
+sha256 b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8 Python-3.4.3.tar.xz
