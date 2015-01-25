From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:30:08 +0100
Subject: [Buildroot] [git commit] docs: fixup the website symlink
Message-ID: <20150125143044.48B90805A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1f4413de6ec4f1484a5111b5c7aa98dd400d56e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, after applying Yann's patch, the symlink pointed to
'.?' instead of just '.'. This commit fixes this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/website b/docs/website
index 9c558e3..945c9b4 120000
--- a/docs/website
+++ b/docs/website
@@ -1 +1 @@
-.
+.
\ No newline at end of file
