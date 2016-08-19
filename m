From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:25:39 +0200
Subject: [Buildroot] [git commit] manual: fix typo
Message-ID: <20160819092545.ABD068050C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6017708fcf63bb6eb1703b1aee43aff549af484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
