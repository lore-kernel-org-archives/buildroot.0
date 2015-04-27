From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] spawn-fcgi: add hash file
Message-ID: <20150427211959.31B6681941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8fee7c7a4b8ced077ec67d8874c72189963beeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spawn-fcgi/spawn-fcgi.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/spawn-fcgi/spawn-fcgi.hash b/package/spawn-fcgi/spawn-fcgi.hash
new file mode 100644
index 0000000..c1911e4
--- /dev/null
+++ b/package/spawn-fcgi/spawn-fcgi.hash
@@ -0,0 +1,2 @@
+# From http://redmine.lighttpd.net/news/9
+sha256	a3cfc7c9581b6ddc31084b379c9160323fa345d357ace6cd2d3d3af3593e2873	spawn-fcgi-1.6.4.tar.bz2
