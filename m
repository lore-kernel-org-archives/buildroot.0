From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] neon: add hash file
Message-ID: <20150427211958.B50F17FD20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1891174335e2ce2ec2a782567b5a2bb7f8af729
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
new file mode 100644
index 0000000..9db5f82
--- /dev/null
+++ b/package/neon/neon.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2	neon-0.30.0.tar.gz
