From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Sep 2013 11:01:35 +0200
Subject: [Buildroot] [PATCH 2 of 4 RFC] trivial: manual: multimedia is no
 longer a subdirectory
In-Reply-To: <patchbomb.1379494893@argentina>
References: <patchbomb.1379494893@argentina>
Message-ID: <c7ec7bbfdcb23650c501.1379494895@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-directory.txt |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -8,7 +8,7 @@ First of all, create a directory under t
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
-+multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
++x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
 New subdirectories are discouraged, however.
 
