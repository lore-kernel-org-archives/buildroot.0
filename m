From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:14:47 +0100
Subject: [Buildroot] [git commit] ebtables: add hash file
Message-ID: <20141213212028.E9021803E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=843a70d11a6d65b3c33421fa3adfa503d4af53e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should clean up download failures like:
http://autobuild.buildroot.net/results/3c6/3c6b15a3d7ba84b7b3c257089569e2f615ec81b2/
http://autobuild.buildroot.net/results/4ee/4ee41e1616184687f56c9e3095885549ac4767d2/
http://autobuild.buildroot.net/results/9c6/9c623e3d9fde75b3dc1724909f6dc9738b12a207/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/ebtables.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
new file mode 100644
index 0000000..75ab7db
--- /dev/null
+++ b/package/ebtables/ebtables.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/ebtables/files/ebtables/ebtables-2-0-10-4/
+sha1	907d3b82329e8fbb7aaaa98049732bd8dab022f9	ebtables-v2.0.10-4.tar.gz
+md5	506742a3d44b9925955425a659c1a8d0		ebtables-v2.0.10-4.tar.gz
