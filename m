From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:10 +0200
Subject: [Buildroot] [git commit branch/next] mtools: add hash file
Message-ID: <20150808105646.F25EE7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27af9ef990c38f219f383ee36caaf07c2a8b5db6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtools/mtools.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
new file mode 100644
index 0000000..5d86498
--- /dev/null
+++ b/package/mtools/mtools.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85	mtools-4.0.18.tar.bz2
