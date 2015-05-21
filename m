From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:09:49 +0200
Subject: [Buildroot] [git commit] flashrom: add hash file
Message-ID: <20150601220248.7E69981D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6402edf9917a81649f1e628c6ea5a2a851460e5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flashrom/flashrom.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
new file mode 100644
index 0000000..a216869
--- /dev/null
+++ b/package/flashrom/flashrom.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 13dc7c895e583111ecca370363a3527d237d178a134a94b20db7df177c05f934 flashrom-0.9.8.tar.bz2
