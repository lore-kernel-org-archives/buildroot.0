From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 16:52:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] docs/manual: fix typo
Message-ID: <20170921145320.5D591810E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=557039368d2509288eb892c01912466d9a6b9f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e10e4d19e3c02a9d251499172a65c77c59e15a67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/using-buildroot-development.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index e167849..1071de5 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -50,11 +50,11 @@ BUSYBOX_OVERRIDE_SRCDIR = /home/bob/busybox/
 When Buildroot finds that for a given package, an
 +<pkg>_OVERRIDE_SRCDIR+ has been defined, it will no longer attempt to
 download, extract and patch the package. Instead, it will directly use
-the source code available in in the specified directory and +make
-clean+ will not touch this directory. This allows to point Buildroot
-to your own directories, that can be managed by Git, Subversion, or
-any other version control system. To achieve this, Buildroot will use
-_rsync_ to copy the source code of the component from the specified
+the source code available in the specified directory and +make clean+
+will not touch this directory. This allows to point Buildroot to your
+own directories, that can be managed by Git, Subversion, or any other
+version control system. To achieve this, Buildroot will use _rsync_ to
+copy the source code of the component from the specified
 +<pkg>_OVERRIDE_SRCDIR+ to +output/build/<package>-custom/+.
 
 This mechanism is best used in conjunction with the +make
