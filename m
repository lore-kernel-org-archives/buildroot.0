From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 15:58:54 +0200
Subject: [Buildroot] [git commit] package/pkg-python.mk: Fix typo
Message-ID: <20140412140108.0AC0F9C749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=017f53d3658176097c10250263bd54e5edd5c980
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c78915e..d6786a3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -183,7 +183,7 @@ endif
 
 # Python interpreter to use for building the package.
 #
-# We may want to specify the python interpreter toi be used for building a
+# We may want to specify the python interpreter to be used for building a
 # package, especially for host-packages (target packages must be built using
 # the same version of the interpreter as the one installed on the target).
 #
