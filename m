From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 13:23:32 +0100
Subject: [Buildroot] [git commit] prerequisite.txt: Bump python dependency
 to 2.7
Message-ID: <20190204122342.3A5D483848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e09d29e62f236b9480653d3e8cbef3035a8fde80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now require python 2.7+, so update prerequisite.txt to match.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 66e1b88f16..dcd3fd255e 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,7 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.6 or any later)
+** +python+ (version 2.7 or any later)
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
