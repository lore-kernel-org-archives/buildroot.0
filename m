From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:24:01 +0200
Subject: [Buildroot] [git commit] input-event-daemon: add .hash file
Message-ID: <20160616202529.43636805FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9b417c65bb510a6b803bdc1f77f8a8e42a43f4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/3e1/3e19c1a6bd534c6c5a0be4e68fc272564685e8d8/
http://autobuild.buildroot.org/results/85f/85f7d67664f2806fb86c24f2e87bd72094e7976b/

Similar to jquery-keyboard, it seems the input-event-daemon tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-event-daemon/input-event-daemon.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/input-event-daemon/input-event-daemon.hash b/package/input-event-daemon/input-event-daemon.hash
new file mode 100644
index 0000000..d5364a9
--- /dev/null
+++ b/package/input-event-daemon/input-event-daemon.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1d9a44160aead88080093f74be9d709fbbc2637f982958e2673d80aedacd0a65  input-event-daemon-v0.1.3.tar.gz
