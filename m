From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 13:17:21 +0200
Subject: [Buildroot] [git commit] trivial: manual: multimedia is no longer a
	subdirectory
Message-ID: <20130918222318.7FB519B737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64a50ee427df9754a2b2dbb62cd2b4a4710e912d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index aac1ced..7bf37c2 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -8,7 +8,7 @@ First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
-+multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
++x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
 New subdirectories are discouraged, however.
 
