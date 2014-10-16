From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 08:07:33 +0200
Subject: [Buildroot] [git commit] xz: add hash file
Message-ID: <20141016060905.A31859D858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1a1f1f5e025d035840901e957d2caeba0779d39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
new file mode 100644
index 0000000..6169b83
--- /dev/null
+++ b/package/xz/xz.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	166c48d2842519bc4f96333bff9e265f8cdda44d38e40594ef3f9bbb52890490	xz-5.0.5.tar.bz2
