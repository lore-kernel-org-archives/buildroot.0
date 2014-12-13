From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:38:21 +0100
Subject: [Buildroot] [git commit] package/libtirpc: add hash file
Message-ID: <20141213214904.AB88D7FE28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d27d44067165b5f0e41b04e36a2731502e959710
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should fix autobuild failures due to SourceForce sending garbage from
time to time:
    http://autobuild.buildroot.net/results/acc/acc086e04da324621c715962585dbdd80e04b74e/
    http://autobuild.buildroot.net/results/acc/acc086e04da324621c715962585dbdd80e04b74e/
    http://autobuild.buildroot.net/results/ca0/ca084460c06f5b69ad35080cd347554a2c53f2a8/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/libtirpc.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
new file mode 100644
index 0000000..34fb0af
--- /dev/null
+++ b/package/libtirpc/libtirpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 45c3e21dfc23a5ba501f9dfc6671678316fdfdb8355a1ec404ae2aa2f81943a1  libtirpc-0.2.4.tar.bz2
