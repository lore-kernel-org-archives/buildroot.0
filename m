From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Sep 2016 23:43:00 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: fix typo
Message-ID: <1474494181-10313-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/developers.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index ea1f894f205c..3c31aa96fa79 100644
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
-- 
2.7.4
