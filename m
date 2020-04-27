From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:04:32 +0200
Subject: [Buildroot] [git commit] package/git: indicate that license file
 hashes are locally calculated
Message-ID: <20200427195650.A7DB39092E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80898842bfddf8c5fe0c9884aaa3140f0e2a6d10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git/git.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/git/git.hash b/package/git/git.hash
index 6261b93ab9..d043590222 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
 sha256  6d65132471df9e531807cb2746f8be317e22a343b9385bbe11c9ce7f0d2fc848  git-2.26.2.tar.xz
+# Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
