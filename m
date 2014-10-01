From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Oct 2014 14:03:41 +0200
Subject: [Buildroot] [git commit] lighttpd: add hash file
Message-ID: <20141001120417.BD6C29D7EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37d41013f89e00cc0a8a49e78795e9e469aefb72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
new file mode 100644
index 0000000..01d3458
--- /dev/null
+++ b/package/lighttpd/lighttpd.hash
@@ -0,0 +1,2 @@
+# From http://www.lighttpd.net/
+sha256	113e9b72ccbd1da5deb0774bf93cf0ca15dc82aad2da0f04e5ab27d37d3f30a3	lighttpd-1.4.35.tar.xz
