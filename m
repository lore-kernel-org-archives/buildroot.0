From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:36:15 +0200
Subject: [Buildroot] [git commit] docs/website: remove broken symlink for
	top-level manual
Message-ID: <20150829083623.86F937FF8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7bd65e1d4cab32608cae1dc2c9ee5ab2dd8206c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recently, we've tried to have the manual lie at the top-level of the
site, to get a shorter URL.

However, that is broken: we do not need only a link the the HTML, but
also to the CSS and to any resource linked from the html (images...).

The server configuration has now been updated to add a redirect, so we
no longer need that symlink anyway. Remove it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/manual.html |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/docs/website/manual.html b/docs/website/manual.html
deleted file mode 120000
index 0c2c818..0000000
--- a/docs/website/manual.html
+++ /dev/null
@@ -1 +0,0 @@
-/var/www/downloads/buildroot/manual/manual.html
\ No newline at end of file
