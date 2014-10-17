From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 16:24:35 +0200
Subject: [Buildroot] [git commit] package/libvorbis: add hash file
Message-ID: <20141017142530.7159FB37E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4b035a68c226ffc50a0bfc7ad4c776a81f2727b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvorbis/libvorbis.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libvorbis/libvorbis.hash b/package/libvorbis/libvorbis.hash
new file mode 100644
index 0000000..3b997ba
--- /dev/null
+++ b/package/libvorbis/libvorbis.hash
@@ -0,0 +1,2 @@
+# From http://www.xiph.org/downloads/
+sha256 2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372 libvorbis-1.3.4.tar.xz
