From: Rodrigo Rebello <rprebello@gmail.com>
Date: Thu, 18 Aug 2016 22:02:11 -0300
Subject: [Buildroot] [PATCH 1/1] manual: fix typo
Message-ID: <1471568531-12041-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 docs/manual/using-buildroot-development.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index a075416..e167849 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -8,7 +8,7 @@ it, configure, compile and install the software component found inside
 this tarball. The source code is extracted in
 +output/build/<package>-<version>+, which is a temporary directory:
 whenever +make clean+ is used, this directory is entirely removed, and
-re-recreated at the next +make+ invocation. Even when a Git or
+re-created at the next +make+ invocation. Even when a Git or
 Subversion repository is used as the input for the package source
 code, Buildroot creates a tarball out of it, and then behaves as it
 normally does with tarballs.
-- 
2.1.4
