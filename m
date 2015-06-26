From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:32:55 +0200
Subject: [Buildroot] [git commit] rrdtool: add hash
Message-ID: <20150626075003.2E88A81870@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=290e8dedf5e28c021bea41424a53520e5abfac98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rrdtool/rrdtool.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
new file mode 100644
index 0000000..20af75a
--- /dev/null
+++ b/package/rrdtool/rrdtool.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3190efea410a6dd035799717948b2df09910f608d72d23ee81adad4cd0184ae9	rrdtool-1.2.30.tar.gz
