From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:06:41 +0200
Subject: [Buildroot] [git commit] libffi: add hash file
Message-ID: <20150407200852.387C07FCEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc41a4bcd5da41bfb4bfee15a1e09ccbfb024c3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libffi/libffi.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
new file mode 100644
index 0000000..4c25fd3
--- /dev/null
+++ b/package/libffi/libffi.hash
@@ -0,0 +1,2 @@
+# From ftp://sourceware.org/pub/libffi/sha512.sum
+sha512	8994973d75facf5ad928c270e17b1a56e24d1543af75b93731a0048e747df27e4190a736b6dc2dca7d43de1d7e88891220304802c10fcccdcebee9c9ffd3d1b9	libffi-3.1.tar.gz
