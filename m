From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:31:28 +0200
Subject: [Buildroot] [git commit] manual: don't use a comment at the end of
	the version variable assignment
Message-ID: <20150427213133.0B8EE81D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=375728d0513bf53f058f07dcc88c426614dc306e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment at the end of the version string assigment could lead to a download
failure so don't use it as a example.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6f5e785..6699951 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -42,7 +42,8 @@ on GitHub. As GitHub is known to have changed download mechanisms in the
 past, the 'github' helper function should be used as shown below.
 
 ------------------------
-FOO_VERSION = v1.0 # tag or full commit ID
+# Use a tag or a full commit ID
+FOO_VERSION = v1.0
 FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
 ------------------------
 
