From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 22:53:46 +0100
Subject: [Buildroot] [git commit] portmap: add a hash file
Message-ID: <20151026215921.7A68681EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7ea96b87d9659dbb46e3ffba3e17f113a265f92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portmap/portmap.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.hash b/package/portmap/portmap.hash
new file mode 100644
index 0000000..e542b2d
--- /dev/null
+++ b/package/portmap/portmap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a281d41de  portmap-6.0.tgz
