From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 18:08:32 +0100
Subject: [Buildroot] [git commit] docs/manual: reinstall target
Message-ID: <20150203170923.74980803CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97a4385184a40abf795e7135f059c36c00d6c5eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add reinstall target information to package-make-target.txt.

[Thomas: update to take into account the fact that we now have a
single <pkg>-reinstall target.]

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/package-make-target.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 25d3f44..c91106e 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -69,6 +69,8 @@ graphs.
 
 | +dirclean+        | Remove the whole package build directory
 
+| +reinstall+       | Re-run the install commands
+
 | +rebuild+         | Re-run the compilation commands - this only makes
 sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a file
 directly in the build directory
