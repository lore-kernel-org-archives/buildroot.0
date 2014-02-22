From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:40:08 +0100
Subject: [Buildroot] [git commit branch/next] docs/manual: indicate how to
	handle BR2_TOOLCHAIN_HAS_THREADS_NPTL
Message-ID: <20140222224511.7357F826F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7586be4aae3ab93badcfad2ccbd434f2e7885f11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 40af809..3dc5395 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -235,7 +235,12 @@ use in the comment.
 
 * thread support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
-** Comment string: +threads+
+** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
+   is also needed, in which case, specifying only +NPTL+ is sufficient)
+
+* NPTL thread support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
+** Comment string: +NPTL+
 
 * RPC support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
