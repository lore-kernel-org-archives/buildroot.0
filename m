From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 18 Sep 2017 11:34:18 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix typo
Message-ID: <1505727258-9352-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/using-buildroot-development.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index e167849cdc36..1071de513278 100644
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
-- 
2.7.4
