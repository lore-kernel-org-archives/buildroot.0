From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Nov 2010 12:07:23 +0100
Subject: [Buildroot] [git commit master 1/1] .gitignore: ignore more patch
	related files
Message-ID: <20101118110951.2EBA18EC3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a417003749a4a9c9a4c6a78b7b962f79f1003278
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches shouldn't be committed to the top level, and that is where
`git format-patch` typically operates, so ignore that stuff.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .gitignore |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 18588e8..685a9c2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,5 +7,8 @@
 /.config
 *.depend
 *.o
+/*.patch
+/*.diff
 *.orig
+*.rej
 *~
-- 
1.7.1
