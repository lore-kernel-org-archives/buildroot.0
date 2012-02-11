From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:04:36 +0200
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1328918676-19482-4-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These should go into a personal file, like:
core.excludesfile=/home/felipec/.gitignore
  .*.sw[nop]

Some people might prefer to see patches, rejects and other files in the
output of 'git status' (e.g. me).

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 .gitignore |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/.gitignore b/.gitignore
index 685a9c2..1a7d636 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,10 +5,3 @@
 /.config.old
 /..config.tmp
 /.config
-*.depend
-*.o
-/*.patch
-/*.diff
-*.orig
-*.rej
-*~
-- 
1.7.9.1.g97f7d
