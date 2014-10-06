From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 09:33:46 +0200
Subject: [Buildroot] [git commit] dejavu: add hash file
Message-ID: <20141006073423.6CA8BB0B8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be4f0dfbb280b57dbb5a87ec6819814587218380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should avoid download issues in the autobuilders, and therefore
ultimately fix issues such as:

  http://autobuild.buildroot.net/results/3da/3dadab55abebf89ab1abd6b943b66d2f70a07e14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dejavu/dejavu.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
new file mode 100644
index 0000000..11e0d1c
--- /dev/null
+++ b/package/dejavu/dejavu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha1 33fa825aa1dd44ce23a11af92b3078e978ff513d dejavu-fonts-ttf-2.34.tar.bz2
