From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 08:17:58 +0100
Subject: [Buildroot] [git commit] package/libmpdclient: add hash file
Message-ID: <20150302222723.E19F58057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbe1f44ac1e3e0c32fa1e93d2e8c28c9936d8a08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: strip trailing newlines]
Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpdclient/libmpdclient.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
new file mode 100644
index 0000000..2fd20a4
--- /dev/null
+++ b/package/libmpdclient/libmpdclient.hash
@@ -0,0 +1,2 @@
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.xz.sig, sha256 locally computed
+sha256 4f08cde82dae70895f8e4532a6e9b54b201efd5591c6b5d6834895807ed2ff82  libmpdclient-2.10.tar.xz
