From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:32:56 +0200
Subject: [Buildroot] [git commit branch/next] gsl: add hash file
Message-ID: <20150808105645.7C06A7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6871f02a8c88f52d0e6153f3914bab8b071fe41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsl/gsl.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
new file mode 100644
index 0000000..bc33e4e
--- /dev/null
+++ b/package/gsl/gsl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	73bc2f51b90d2a780e6d266d43e487b3dbd78945dd0b04b14ca5980fe28d2f53	gsl-1.16.tar.gz
