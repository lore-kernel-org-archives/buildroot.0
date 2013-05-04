From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 12:41:55 +0200
Subject: [Buildroot] [git commit] update gitignore
Message-ID: <20130504112539.0240399AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=145508473c0e9884a9f9bb53455413ae815861ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not track *.pyc files (from modules embedded in Buildroot source
tree).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 685a9c2..bb02d9f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,3 +12,4 @@
 *.orig
 *.rej
 *~
+*.pyc
