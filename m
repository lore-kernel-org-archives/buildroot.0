From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 22:26:55 +0200
Subject: [Buildroot] [git commit] docs/website: fix manual symlink
Message-ID: <20150826203534.CA8EA7FCEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=551971984c74c989bc5749380bf276980a9efa5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should point to the filesystem path on the server, not the HTTP virtual path.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/manual.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/website/manual.html b/docs/website/manual.html
index bd5552e..0c2c818 120000
--- a/docs/website/manual.html
+++ b/docs/website/manual.html
@@ -1 +1 @@
-/downloads/manual/manual.html
\ No newline at end of file
+/var/www/downloads/buildroot/manual/manual.html
\ No newline at end of file
