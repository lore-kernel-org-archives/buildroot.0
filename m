From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 00:02:52 +0200
Subject: [Buildroot] [git commit] docs/manual: fix typo
Message-ID: <20160921220318.C4F8782257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0eaee1b92b28df79d5f4ad4f33c85850d99f5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/developers.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index ea1f894..3c31aa9 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -5,8 +5,8 @@
 == DEVELOPERS file and get-developers
 
 The main Buildroot directory contains a file named +DEVELOPERS+ that
-list the developers involved with various areas of Buildroot. Thanks to
-this file, the +get-developer+ tool allows to:
+lists the developers involved with various areas of Buildroot. Thanks
+to this file, the +get-developer+ tool allows to:
 
 - Calculate the list of developers to whom patches should be sent, by
   parsing the patches and matching the modified files with the
