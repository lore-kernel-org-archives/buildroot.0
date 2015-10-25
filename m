From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:09:36 +0100
Subject: [Buildroot] [git commit] package/kodi: add hash
Message-ID: <20151025211011.423587FD09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baafc06a2bf2f775d96e967beb085ddacfacefcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I forgot to add the hash file in the 15.2 bump:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/130039

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
new file mode 100644
index 0000000..14af9af
--- /dev/null
+++ b/package/kodi/kodi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	dd8aeb942e6de5d1488e243e1346cff3f6597e21b5131a3ba72ff5cc82037110	kodi-15.2-Isengard.tar.gz
