From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:31:57 +0100
Subject: [Buildroot] [git commit] liblo: add hash file
Message-ID: <20141213213408.BD77E801F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b08c503b244d371159082ab540fd17df09b4fc2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/579/579df46b1fdb46fa5ec0fd28324cf28b7c06b5bb/
http://autobuild.buildroot.net/results/f20/f2023b000b3ef8d459bba04a29f58be88246cb46/
http://autobuild.buildroot.net/results/e2a/e2acf1f0355df709836e92e4382019b6e8f77978/
http://autobuild.buildroot.net/results/5b9/5b9c2a678a0950def2aeaf7e5809386c5923e974/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblo/liblo.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
new file mode 100644
index 0000000..a4e01a6
--- /dev/null
+++ b/package/liblo/liblo.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
+sha1	21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
+md5	5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
